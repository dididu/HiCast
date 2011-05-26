/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

// This example demonstrates placing items in a view using
// a VisualItemModel

import Qt 4.7

Rectangle {
    color: "red"
    anchors.fill: parent

    id: main
    state: "PodcastList"

    ToolBar {
        id: toolBar

        x: 0
        y: 0

        onBack: {
            if(main.state == "PodcastList") Qt.quit();
            if(main.state == "EpisodeList") main.state = "PodcastList";
            if(main.state == "AudioPlayer") main.state = "EpisodeList";
        }
    }

    PodcastList {
        id: podcastListView

        x: 0
        anchors.top: toolBar.bottom
        width: parent.width
        height: parent.height

        mainScreen: main
    }
/*

    EpisodeList
    {
        id: episodeListView;


        listHeight: parent.height - podcastListView.blockSize

        anchors.top:  podcastListView.top
        anchors.left: podcastListView.right

        mainScreen: main;
    }

    AudioPlayer
    {
        id: audioplayer;

        anchors.top:  podcastListView.top
        anchors.left: episodeListView.right

        mainScreen: main;
    }

*/
    states: [
             State {
                 name: "PodcastList"
                 PropertyChanges { target: podcastListView; x: 0 }
                 PropertyChanges { target: toolBar; state: "QuitButton" }

             },

            State {
                name: "EpisodeList"
                PropertyChanges { target: podcastListView; x: -podcastListView.width }
                PropertyChanges { target: toolBar; state: "BackButton" }
            },

            State {
                name: "AudioPlayer"
                PropertyChanges { target: podcastListView; x: -podcastListView.width*2 }
                PropertyChanges { target: toolBar; state: "BackButton" }
            }
         ]

    transitions: Transition {
         PropertyAnimation {  property: "x"; duration: 300 }
     }



}
