import Qt 4.7

Rectangle {

    property Rectangle mainScreen
    property int blockSize: 80


    height: blockSize
    width: parent.width

    color: "black"

    AddPodcastDialog {id: addPodcastDialog; width: 200; height: 200;  }


    ListView {
        id: podcastList

        anchors { fill: parent; }

        orientation: ListView.Horizontal


        model: myModel

        delegate:
            Rectangle {

                width: blockSize
                height: blockSize

                gradient: Gradient {
                        GradientStop { position: 0.0; color: Qt.darker("darkGray")}
                        GradientStop { position: 1.0; color: "Black" }
                }

                Column {
                    spacing: 5
                    Text {
                        x: parent.x + 10
                        text: title
                        font.pixelSize: 20
                        color: "white"
                    }

                    /*
                    Text {
                        x: parent.x + 10
                        text: feed
                        font.pixelSize: 15
                        color: "lightgray"
                    }
                    */
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: mainScreen.state = "EpisodeList"
                }
            }

        footer:
            Rectangle {

                width: blockSize
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
