#include <QFile>
#include "podcastlistmodel.h"

QString Podcast::title() const
{
    return m_title;
}

QString Podcast::feed() const
{
    return m_feed;
}


PodcastListModel::PodcastListModel(QObject *parent) :
    QAbstractListModel(parent)
{
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "title";
    roles[FeedRole] = "feed";
    setRoleNames(roles);
}

void PodcastListModel::addPodcast(const Podcast &podcast)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_podcasts << podcast;
    endInsertRows();
}

int PodcastListModel::rowCount(const QModelIndex& parent) const {
    return m_podcasts.count();
}

QVariant PodcastListModel::data(const QModelIndex& index, int role) const {
    if (index.row() < 0 || index.row() > m_podcasts.count())
        return QVariant();

    const Podcast& podcast = m_podcasts[index.row()];

    if (role == TitleRole)
        return podcast.title();
    else if (role == FeedRole)
        return podcast.feed();
    return QVariant();
}


bool PodcastListModel::loadModel(const QString& filename)
{
    QFile file(filename);
    file.open(QIODevice::ReadOnly);
    QDataStream in(&file);

    in >> m_podcasts;

    file.close();

    return true;
}

bool PodcastListModel::saveModel(const QString& filename)
{
    QFile file(filename);
    file.open(QIODevice::WriteOnly);
    QDataStream out(&file);

    out << m_podcasts;

    file.close();

    return true;
}
