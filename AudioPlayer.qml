import Qt 4.7

Rectangle {

    id: audioPlayer

    width: parent.width
    height: 60

    color: "black"
    opacity: 1.0


    Column {
        width: parent.width

        Row {

            opacity: 1.0
            spacing: 10

            Image {
                id: playButton
                source: "media/media-playback-start.svg"
            }

            Image {
                id: stopButton
                source: "media/media-playback-stop.svg"
            }
        }

        Item {
            id: progress
            width: parent.width
            height: 10

            Rectangle {
                id: progressBar
                height: 10
                width: parent.width
                gradient: Gradient {
                             GradientStop { position: 0.0; color: "lightBlue" }
                             GradientStop { position: 1.0; color: "Gray"}
                         }

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





}
