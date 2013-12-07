import QtQuick 1.1

Rectangle {
    id: logo

    property alias animationRunning: echoAnimation.running

    width: 200
    height: 200
    color: "transparent"
    border.color: "#249ca4"
    border.width: 15
    radius: width * 0.4


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log("Logo tapped.")
            echoAnimation.start()
        }
    }

    Text {
        id: logoText
        text: qsTr("nfc")

        anchors.fill: parent

        font.pixelSize: 80
        color: parent.border.color

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: echo
        width: parent.width
        height: parent.height
        radius: parent.radius

        color: parent.color
        border.width: parent.border.width
        border.color: parent.border.color

        ParallelAnimation {
            id: echoAnimation
            NumberAnimation { target: echo; property: "scale"; from: 1; to: 1.4; duration: 500 }
            NumberAnimation { target: echo; property: "opacity"; from: 0.5; to: 0; duration: 400 }
        }
    }

}
