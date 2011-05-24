#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QTextStream>

#include "podcaststore.h"

#include "episode.h"


bool PodcastStore::instanceFlag = false;
PodcastStore* PodcastStore::instance = NULL;
QSqlDatabase PodcastStore::db;

PodcastStore::PodcastStore()
{
    bool ret;

    // Find QSLite driver
    db = QSqlDatabase::addDatabase("QSQLITE");

#ifdef Q_OS_LINUX
    // NOTE: We have to store database file into user home folder in Linux
    QString path(QDir::home().path());
    path.append(QDir::separator()).append("hicast.db.sqlite");
    path = QDir::toNativeSeparators(path);
    db.setDatabaseName(path);
#else
    // NOTE: File exists in the application private folder, in Symbian Qt implementation
    db.setDatabaseName("hicast.db.sqlite");
#endif

    ret = db.open();
    qWarning("Database open returns: %d", ret);

    if (!ret) {
        QMessageBox::critical(0, "Cannot open database",
            "Unable to establish a database connection.\n"
                     "This example needs SQLite support. Please read "
                     "the Qt SQL driver documentation for information how "
                     "to build it.\n\n"
                     "Click Cancel to exit.", QMessageBox::Cancel);
    }

    QStringList dbTables = db.tables();
    if (dbTables.isEmpty())
    {
        if (db.isOpen())
        {
            QSqlQuery query;
            ret = query.exec("create table podcasts ("
                                  "podcastname varchar(255), "
                                  "episodename varchar(255), "
                                  "status integer, "
                                  "size integer, "
                                  "duration integer, "
                                  "playposition integer)"
                                  );

            qWarning("Database table create returns: %d", ret);
        }
    }
}

bool PodcastStore::syncEpisodeWithDB(Episode* e)
{
    QSqlQuery query;
    QString cmd;
    bool ret;

    QTextStream(&cmd) << "SELECT * FROM podcasts WHERE podcastname='" << e->podcastName() << "' AND " <<
                         " episodename='" << e->name() << "'";
    ret = query.exec(cmd);

    if(!ret) return false;

    if (query.next())
    {
        // this episode alrady exists in the database
        return true;
    } else
    {
        // need to create new record for the episode
        query.clear();
        e->setStatus(Episode::ENotDownloaded);

        cmd.clear();

        QTextStream(&cmd) << "INSERT INTO podcasts VALUES ('" << e->podcastName() << "', '" <<
                              e->name() << "', " << e->status() << ", " << e->size() << ", " <<
                              e->duration() << ", " << e->playPosition() << ")";

        if(!query.exec(cmd)) return false;


    }

    return true;
}

void PodcastStore::close()
{
    db.close();
}
