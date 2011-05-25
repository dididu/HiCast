#-------------------------------------------------
#
# Project created by QtCreator 2010-09-30T17:06:15
#
#-------------------------------------------------

QT       += core gui declarative sql

TARGET = HiCast
TEMPLATE = app


SOURCES += main.cpp\
    episode.cpp \
    podcaststore.cpp \
    podcastlistmodel.cpp

HEADERS  += \
    episode.h \
    podcaststore.h \
    podcastlistmodel.h

OTHER_FILES += \
    EpisodeList.qml \
    EpisodeDelegate.qml \
    PodcastList.qml \
    Main.qml \
    AudioPlayer.qml \
    AddPodcastDialog.qml \
    Main.qml \
    ToolBar.qml \
    AbstractButton.qml
