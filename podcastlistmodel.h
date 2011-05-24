#ifndef PODCASTLISTMODEL_H
#define PODCASTLISTMODEL_H

#include <QAbstractListModel>
#include <QFile>

class Podcast {
public:
    Podcast(const QString& title, const QString& feed)
        : m_title(title), m_feed(feed)
    {
    }

    Podcast()
    {
    }

    QString title() const;
    QString feed() const;

    friend QDataStream& operator << (QDataStream& out, const Podcast& podcast)
    {
        out << podcast.title();
        out << podcast.feed();
        return out;
    }

    friend QDataStream& operator >> (QDataStream& out, Podcast& podcast)
    {
        out >> podcast.m_title;
        out >> podcast.m_feed;
        return out;
    }

private:
    QString m_title;
    QString m_feed;

};





class PodcastListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit PodcastListModel(QObject *parent = 0);

    void addPodcast(const Podcast& podcast);

    int rowCount(const QModelIndex& parent = QModelIndex()) const;

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

    bool loadModel(const QString& fileName);
    bool saveModel(const QString& fileName);


    enum PodcastRoles {
        TitleRole = Qt::UserRole + 1,
        FeedRole
    };

private:
    QList<Podcast> m_podcasts;
};

#endif // PODCASTLISTMODEL_H
