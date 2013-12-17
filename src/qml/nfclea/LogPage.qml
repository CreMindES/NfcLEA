import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: logPage
    tools: historyTools
    anchors.margins: UiConstants.DefaultMargin
    orientationLock: PageOrientation.LockPortrait

    SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

    Component {
        id: listHeader

        Text {
            id: pageLabel
            text: qsTr("Notifications")

            color: "#249ca4"

            font.pointSize: 35

            height: 100
            width: parent.width - 10
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

                color: if(logEntryType === 0) return "light blue"
                       else if(logEntryType === 1) return "light green"
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

                    text: if(logEntryType === 0) return "NFC tag contacted\nUID: " + nfcUid
                          else return "Rule: " + nfcUid

                    font.pointSize: 18

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    //height: parent.height
                }

                Text {
                    id: logTimeElapsed

                    text: timeElapsed

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
        model: appLogModel
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

        ToolIcon {
            iconId: "toolbar-back"
            onClicked: pageStack.pop()
        }
        ToolIcon {
            iconId: "toolbar-view-menu" ;
            enabled: (myMenu.status === DialogStatus.Closed) ? true : false
            onClicked: (myMenu.status === DialogStatus.Closed) ? logMenu.open() : logMenu.close()
        }
    }

    Menu {
        id: logMenu
        visualParent: logPage.parent
        MenuLayout {
            MenuItem {
                text: qsTr("Clear history")
                onClicked: appLogModel.clearHistory()
            }
        }
    }
}
