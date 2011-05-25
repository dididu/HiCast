import Qt 4.7

Rectangle {

    property Rectangle mainScreen
    property int blockSize: 80

    color: "black"

    AddPodcastDialog {id: addPodcastDialog; width: 200; height: 200;  }

    ListView {
        id: podcastList

        anchors { fill: parent; }

        model: myModel

        delegate:
            Rectangle {

                id: podcastListDelegate

                width: parent.width
                height: blockSize

                gradient: Gradient {
                        GradientStop { position: 0.0; color: Qt.darker("darkgray")}
                        GradientStop { position: 1.0; color: "black" }
                }

                Image {
                    id: podcastIcon
                    anchors.verticalCenter: podcastListDelegate.verticalCenter
                    anchors.leftMargin: 10
                    anchors.left: podcastListDelegate.left

                    source: "C:/Users/My Dropbox/Projects/HiCast/media/podcast_icon&32.png"
                }


                Column {
                    anchors.left: podcastIcon.right
                    anchors.leftMargin: 10

                    anchors.verticalCenter: podcastListDelegate.verticalCenter
                    spacing: 5

                    Text {
                        text: title
                        font.pixelSize: 20
                        color: "white"
                    }


                    Text {
                        text: feed
                        font.pixelSize: 15
                        color: "lightgray"
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: mainScreen.state = "EpisodeList"
                }
            }

        footer:
            Rectangle {

                width: parent.width
                height: blockSize

                gradient: Gradient {
                    GradientStop { id: stop1; position: 0.0; color: "darkGreen"}
                        GradientStop { position: 1.0; color: "Black" }
                }

                Text {
                    anchors.centerIn: parent;
                    color: "white"

                    font.bold: true
                    font.pixelSize: 50
                    text: "+"

                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: stop1.color = "green"
                    onReleased: stop1.color = "darkGreen"

                    onClicked: {
                        console.log(addPodcastDialog.bottom)
                        addPodcastDialog.visible = true;

                    }
                }
            }
    }
}
