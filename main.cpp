#include <QtGui/QApplication>
#include <qdeclarative.h>
#include <QDeclarativeView>
#include <QDeclarativeContext>

#include "episode.h"
#include "podcaststore.h"
#include "podcastlistmodel.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);   

    qmlRegisterType<Episode>("PodcastLib", 1, 0, "Episode");

    PodcastListModel model;
/*
    model.addPodcast(Podcast("RT1", "http://feed1here"));
    model.addPodcast(Podcast("RT2", "http://feed2here"));
    model.addPodcast(Podcast("RT3", "http://feed3here"));

    model.saveModel(QString("hicast.dat"));
*/
    model.loadModel(QString("hicast.dat"));

    QDeclarativeView view;
    QDeclarativeContext *ctxt = view.rootContext();
    ctxt->setContextProperty("myModel", &model);       

    view.setSource(QUrl("qrc:/qml/Main.qml"));
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);

    QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &a, SLOT(quit()));


#if defined(Q_WS_MAEMO_5)
    view.setGeometry(QRect(0, 0, 800, 480));
    view.showFullScreen();
#elif defined(Q_WS_S60)
    view.setGeometry(QRect(0, 0, 640, 360));
    view.showFullScreen();
#else
    view.setGeometry(QRect(100, 100, 800, 480));
    view.show();
#endif

    a.exec();

    PodcastStore::getInstance()->close();

    return 0;
}
