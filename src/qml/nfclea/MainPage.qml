import QtQuick 1.1
import com.nokia.meego 1.1
//import Nfc 1.0

Page {
    id: listPage
    tools: commonTools
    anchors.margins: UiConstants.DefaultMargin
    //orientationLock: lockInPortrait

    function openFile(file) {
        var component = Qt.createComponent(file)

        if (component.status == Component.Ready)
            pageStack.push(component);
        else
            console.log("Error loading component:", component.errorString());
    }

    Connections {
        target: nfcManager

        onTagDetected: {
            console.log("QML: target detected")
            applogo.animationRunning = true
            notificationBar.message = "UID: " + uid
            notificationBar.opacity = 0.8
        }
        onNfcReadTagUri: {
            console.log("uri: " + nfcTagUri)
        }
        onTagLost: {
            notificationBar.opacity = 0
            notificationBar.message = "Tag contact ended"
            notificationBar.opacity = 0.8
            notificationBarTimer.start();
        }

        ignoreUnknownSignals: true
    }

        //onTargetDetected: conlose.log("I'm happy: ", target.uid)
        //onIsNfcAvailableChanged: console.log(isNfcAvailable);
        //onTagPresent: console.log("I'm happy")


    NotificationBar {
        id: notificationBar
        anchors.top: parent.top
        message: "Hello"
        opacity: 0
    }

    Timer {
        id: notificationBarTimer
        interval: 1000
        running: false
        repeat: false
        onTriggered: notificationBar.opacity = 0;
    }

    NfcLogo {
        id: applogo

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 200
    }

    Button {
        id: buttonActiveRules
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: buttonRuleManager.top
            bottomMargin: 10
        }
        text: qsTr("Active Rules")
        onClicked: {
            listPage.openFile("ActiveRulesPage.qml")
        }
    }

    Button {
        id: buttonRuleManager
        anchors {
            horizontalCenter: parent.horizontalCenter
            //top: buttonActiveRules.bottom
            //topMargin: 10
            bottom: parent.bottom
            bottomMargin: 20
        }
        text: qsTr("Rule Manager")
        onClicked: listPage.openFile("RuleManagerPage.qml")
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            id: menuToolbar
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
        ToolIcon {
            platformIconId: "toolbar-history"
            onClicked: listPage.openFile("LogPage.qml")
        }
        ToolIcon {
            platformIconId: "toolbar-column"
            anchors.left: parent.left
            onClicked: listPage.openFile("TestPage.qml")
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("About"); onClicked: listPage.openFile("AboutPage.qml")}
        }
    }
}
