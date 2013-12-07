// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    property alias message: notificationText.text

    width: parent.width
    height: 70

    color: "#249ca4"
    radius: 10
    opacity: 0.6

    Text {
        id: notificationText
        anchors.fill: parent

        font.pixelSize: 25
        color: "#ffffff"

        text: "Notification message"
        font.bold: false

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
    }
}
