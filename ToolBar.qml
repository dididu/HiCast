import QtQuick 1.0

Rectangle {

    id: toolbarComponent

    signal back

    width: parent.width
    height: 70
    color: "black"

    Text {
        id: titleBar
    }

    AbstractButton {
        id: backButton
        anchors.right: parent.right
        buttonImage: "/media/on-off_icon-48.png"

        onClicked: toolbarComponent.back();
    }

    states: [
             State {
                 name: "QuitButton"
                 PropertyChanges { target: backButton; buttonImage: "/media/on-off_icon-48.png" }
             },

            State {
                name: "BackButton"
                PropertyChanges { target: backButton; buttonImage: "/media/undo_icon-48.png" }
            }
         ]
}
