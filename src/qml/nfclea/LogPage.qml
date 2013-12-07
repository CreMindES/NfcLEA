import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: logPage
    tools: historyTools
    anchors.margins: UiConstants.DefaultMargin

    SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

    Component {
        id: listHeader

        Text {
            id: pageLabel
            text: "History"

            color: "#f8249ca4"

            font.pointSize: 35

            height: 80
            width: parent.width - 10
            //anchors.top: logListView.top
            //anchors.topMargin: 5
            //anchors.left: logListView.left
            //anchors.leftMargin: 5
        }
    }

    ListModel {
        id: logModel
        ListElement {
            eventType: "nfc"
            uid: "45646546546546"
            timeElapsed: "5h"

        }
        ListElement {
            eventType: "nfc"
            uid: "456hhdz777222d"
            timeElapsed: "6h"
        }
        ListElement {
            eventType: "ruleActivation"
            uid: "Light1";
            timeElapsed: "8h"
        }
        ListElement {
            eventType: "ruleDeactivation"
            uid: "Light3"
            timeElapsed: "8h"
        }
        ListElement {
            eventType: "nfc"
            uid: "45646546546546"
            timeElapsed: "5h"

        }
        ListElement {
            eventType: "nfc"
            uid: "456hhdz777222d"
            timeElapsed: "6h"
        }
        ListElement {
            eventType: "nfc"
            uid: "45646546546546"
            timeElapsed: "5h"

        }
        ListElement {
            eventType: "nfc"
            uid: "456hhdz777222d"
            timeElapsed: "6h"
        }
        ListElement {
            eventType: "nfc"
            uid: "45646546546546"
            timeElapsed: "5h"

        }
        ListElement {
            eventType: "nfc"
            uid: "456hhdz777222d"
            timeElapsed: "6h"
        }
        ListElement {
            eventType: "nfc"
            uid: "45646546546546"
            timeElapsed: "5h"

        }
        ListElement {
            eventType: "nfc"
            uid: "456hhdz777222d"
            timeElapsed: "6h"
        }
    }

    Component {
    id: logDelegate

        Rectangle {
            id: nfcLogEntryContainer

            width: parent.width
            height: 100

            //color: "lightsteelblue"
            color: "#e8e7e7"
            radius: 20

            //border.width: 1
            //border.color: "#000"

            Rectangle {
                id: colorCode

                width: parent.width / 2
                height: parent.height

                color: if(eventType === "nfc") return "light blue"
                       else if(eventType === "ruleActivation") return "light green"
                       else return "red"
                radius: parent.radius

                anchors.left: parent.left
            }

            Rectangle {
                id: nfcLogEntry

                width: parent.width - 60
                height: parent.height

                color: "#e8e7e7"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -10

                Text {
                    id: nfcLogEntryName

                    text: if(eventType === "nfc") return "NFC tag contacted\nUID: " + uid
                          else return "Rule: " + uid

                    font.pointSize: 18

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    //height: parent.height
                }

                Text {
                    id: logTimeElapsed

                    text: timeElapsed + " ago"

                    color: "#696363"
                    font.pointSize: 10

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                }
            }

            Text {
                id: detailsArrow

                text: ">"
                font.family: "MS UI Gothic"

                width: parent.width - nfcLogEntry.width - 20
                height: parent.height

                font.pixelSize: 35

                anchors.right: parent.right

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    ListView {
        id: logListView
        model: logModel
        delegate: logDelegate
        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true

        header: listHeader

        //clip: true

        spacing: 10

        boundsBehavior: Flickable.DragAndOvershootBounds
        snapMode: ListView.SnapToItem

        anchors.fill: parent
    }

    ToolBarLayout {
        id: historyTools

        ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
        ToolIcon {
            iconId: "toolbar-view-menu" ;
            onClicked: (myMenu.status === DialogStatus.Closed) ? logMenu.open() : logMenu.close()
        }
    }

    Menu {
        id: logMenu
        visualParent: logPage
        MenuLayout {
            MenuItem { text: qsTr("Clear history") }
        }
    }
}
