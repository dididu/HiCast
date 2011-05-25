import QtQuick 1.0

Rectangle {
    id: buttonId

    property string buttonImage

    signal clicked


    width: parent.height
    height: parent.height
    radius: 5

    gradient: Gradient {
        GradientStop {
            id: gradientstop1
            position: 0
            color: "#333333"
        }

        GradientStop {
            id: gradientstop2
            position: 0.14
            color: "#585757"
        }

        GradientStop {
            id: gradientstop3
            position: 1
            color: "#000000"
        }
    }

    anchors.right: parent.right

    Image {
        anchors.centerIn: buttonId
        source: buttonImage
    }

    MouseArea {
        anchors.fill: buttonId

        onPressed: {
            buttonId.state = "pressed"
        }

        onReleased: {
            buttonId.state = "normal"
        }

        onClicked: buttonId.clicked()
    }
    states: [
        State {
            name: "pressed"

            PropertyChanges {
                target: gradientstop1
                position: 0
                color: "#2d2d2d"
            }

            PropertyChanges {
                target: gradientstop2
                position: 0.15
                color: "#918e8e"
            }

            PropertyChanges {
                target: gradientstop3
                position: 1
                color: "#363636"
            }
        }
    ]
}
