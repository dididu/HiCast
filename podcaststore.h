#ifndef PODCASTSTORE_H
#define PODCASTSTORE_H

#include <QObject>
#include <QVariant>
#include <QMessageBox>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

#include <QDir>


class Episode;

class PodcastStore
{
public:

    static bool instanceFlag;
    static PodcastStore *instance;

    static PodcastStore* getInstance()
    {
        if(!instanceFlag)
            {
                instance = new PodcastStore();
                instanceFlag = true;
                return instance;
            }
            else
            {
                return instance;
            }
    }

    static QSqlDatabase db;

    bool syncEpisodeWithDB(Episode* e);

    void close();


private:

    PodcastStore();




    //QString sqlCreateTableCommand;

};


#endif // PODCASTSTORE_H
