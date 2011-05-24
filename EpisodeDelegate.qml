import Qt 4.7
import PodcastLib 1.0

Rectangle {

    Episode {

        id: episode
        status: 0

        //Component.onCompleted: getEpisodeStatus(episodeTitle)
        onStatusUpdated: episodeStatusText.text = status
    }

    id: episodeDelegate

    width: parent.width
    height: 40

    gradient: Gradient {
            GradientStop { id: gradientStop1; position: 0.0; color: Qt.darker("darkGray")}
            GradientStop { id: gradientStop2; position: 1.0; color: "Black" }
    }

    MouseArea {
           anchors.fill: parent
           onClicked: {
               episodeDelegate.state = episodeDelegate.state=='Details'?'Normal':'Details';
           }
    }

    Column {
        spacing: 5
        x: parent.x+5

        width: parent.width

        Row {

            spacing: 10
            width: parent.width

            Text {
                id: episodeStatusText


                text: episode.status
                color: "lightgreen"
                font.bold: true

                Component.onCompleted: {
                    episode.name = episodeTitle.text
                    episode.updateEpisode();
                }

            }

            Text {
                id: episodeTitle
                color: "white"
                text: title
                font.pixelSize: 20
            }
        }

        Item {
            width: parent.width
            height: 40


            id: episodeDetails
            opacity: 0.0

            Column {                
                Text {
                    color: "white"
                    text: pubDate
                }
                Text {
                    color: "white"
                    text: mp3Url
                }

                AudioPlayer { width: episodeDelegate.width - 10}
            }
        }





    }

    states: [State {
                    name: "Details"
                    PropertyChanges { target: episodeDelegate; height: 150}
                    PropertyChanges { target: episodeDetails; opacity: 1.0}
                    PropertyChanges { target: gradientStop1; color: "darkBlue" }
             },

             State {
                    name: "Normal"
                    PropertyChanges { target: episodeDelegate; height: 40}
             }
    ]

    transitions: Transition {
        // Make the state changes smooth
        ParallelAnimation {
            NumberAnimation { duration: 300; properties: "opacity,x,contentY,height,width" }
        }
    }
}

