import Qt 4.7

Rectangle {

    property Rectangle mainScreen

    width: parent.width
    height: parent.height

    color: "black"
    opacity: 1.0


    Image {
        id: playButton
        x: 26
        y: 26
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "media/media-playback-start.svg"
    }

    Item {
        id: progress
        width: parent.width
        height: 10
        anchors.bottom: parent.bottom        

        Rectangle {
            id: progressBar
            x: 0
            y: 0
            height: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: parent.width
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightBlue" }
                GradientStop { position: 1.0; color: "Gray"}
            }

            Rectangle {
                id: progressBarHighlight
                x: progressBar.x;
                y: progressBar.y;

                height: 10
                width: parent.width/2
                color: "red"
                opacity: 0.4
            }

        }


    }

    Text {
        id: text1
        x: -81
        y: 184
        text: "text"
        font.pixelSize: 12
    }





}
