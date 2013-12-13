import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: networkSettingsPage
    tools: networkSettingsTools
    anchors.margins: UiConstants.DefaultMargin
    orientationLock: PageOrientation.LockPortrait

    property int labelWidth: networkSettingsPage.width / 2 - 20
    property int textFieldWidth: networkSettingsPage.width - labelWidth - 5

    function getClientSettings() {
        hostAddressField.text = client.getHostAddress();
        portNumberField.text = client.getPortNumber();
    }

    Text {
        id: networkSettingsPageTitle
        text: qsTr("Network Settings")

        color: "#f8249ca4"
        font.pointSize: 35

        height: 80
        width: parent.width - 20

        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    Text {
        id: networkSettingsTitle

        text: qsTr("Server")

        color: "#f8249ca4"
        font.pointSize: 25

        anchors.top: networkSettingsPageTitle.bottom
        anchors.topMargin: 10
    }

    Item {
        id: networkSettingsContainer

        height: 100

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: networkSettingsTitle.bottom
        anchors.topMargin: 10

        Text {
            id: hostAddressLabel

            width: labelWidth

            text: qsTr("Host address")
            font.pointSize: 20

            anchors.verticalCenter: hostAddressField.verticalCenter
            anchors.left: parent.left
        }

        TextField {
            id: hostAddressField

            width: textFieldWidth

            placeholderText: qsTr("Enter IP address here")
            anchors.right: parent.right
        }

        Text {
            id: portNumberLabel

            width: labelWidth

            text: qsTr("Port")
            font.pointSize: 20

            anchors.verticalCenter: portNumberField.verticalCenter
            anchors.left: parent.left
        }

        TextField {
            id: portNumberField

            width: textFieldWidth

            anchors.top: hostAddressField.bottom
            anchors.topMargin: 5
            placeholderText: qsTr("Enter port number here")
            anchors.right: parent.right
        }
    }

    Text {
        id: userSettingsTitle

        text: "User"

        color: "#f8249ca4"
        font.pointSize: 25

        anchors.top: networkSettingsContainer.bottom
        anchors.topMargin: 20
    }

    Item {
        id: userSettingsContainer

        height: 100

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: userSettingsTitle.bottom
        anchors.topMargin: 10

        Text {
            id: usernameLabel

            width: labelWidth

            text: qsTr("Username")
            font.pointSize: 20

            anchors.verticalCenter: usernameField.verticalCenter
        }
        TextField {
            id: usernameField

            width: textFieldWidth

            //placeholderText: qsTr("Enter username")
            anchors.top: userSettingsContainer.top
            anchors.topMargin: 10
            anchors.right: parent.right
        }

        Text {
            id: passwordLabel

            width: labelWidth

            text: qsTr("Password")
            font.pointSize: 20

            anchors.verticalCenter: passwordField.verticalCenter
        }
        TextField {
            id: passwordField
            echoMode: TextInput.Password

            width: textFieldWidth

            anchors.top: usernameField.bottom
            anchors.topMargin: 5
            anchors.right: parent.right
        }
    }

    Row {
        id: buttonContainer

        width: 220

        spacing: 10

        anchors.top: userSettingsContainer.bottom
        anchors.topMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: saveButton

            width: 220
            text: qsTr("Save")

            onClicked: {
                client.connectToServer(hostAddressField.text, portNumberField.text)
                pageStack.pop()
            }
        }
        /*
        Button {
            id: saveConnectButton

            width: 220
            text: qsTr("Save & Connect")

            onClicked: {
                client.connectToServer(hostAddressField.text, portNumberField.text)
                pageStack.pop()
            }
        }
        */
    }

    ToolBarLayout {
        id: networkSettingsTools

        ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
    }

    Component.onCompleted: getClientSettings()
}
