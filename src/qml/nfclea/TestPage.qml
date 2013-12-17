import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: logPage
    tools: historyTools
    anchors.margins: UiConstants.DefaultMargin

    /*Connections{
        target: appLogModel2
        onLogCountChanged: {
            console.log("New log added.")
        }
    }*/

    ListView {
        id: listview
        anchors.fill: parent

        model: appLogModel
        delegate:
            Text {
                text: nfcUid
            }
        /*
            Text {
                id: text2
                text: logCount
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
            }
*/

        spacing: 10
    }


//  LogPage
/*
    Text {
        id: pageLabel
        text: "History"

        color: "#249ca4"

        font.pointSize: 35

        height: 80
        width: parent.width - 10
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
    }

    Flickable {
        id: logEntryContainer

        width: parent.width - 20
        height: parent.height - pageLabel.height - 5 - 20

        anchors.top: pageLabel.bottom
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: nfcLogEntryContainer

            width: parent.width
            height: 100

            color: "lightsteelblue"
            radius: 20

            border.width: 1
            border.color: "#000"

            Rectangle {
                id: colorCode

                width: parent.width / 2
                height: parent.height

                color: "#85e3f1"
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

                    text: "NFC tag contacted\nUID: 45646546546546"

                    font.pointSize: 18

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    //height: parent.height
                }

                Text {
                    id: logTimeElapsed
                    color: "#696363"

                    text: "5h ago"
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.pointSize: 10

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
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

        Rectangle {
            id: nfcLogEntryContainer2

            width: parent.width
            height: 100

            color: "lightsteelblue"
            radius: 20

            anchors.top: nfcLogEntryContainer.bottom
            anchors.topMargin: 10

            //border.width: 1
            //border.color: "#000"

            Rectangle {
                id: colorCode2

                width: parent.width / 2
                height: parent.height

                color: "#48e24a"
                radius: parent.radius

                anchors.left: parent.left
            }

            Rectangle {
                id: nfcLogEntry2

                width: parent.width - 60
                height: parent.height

                color: "#ea4c4c"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -10

                Text {
                    id: nfcLogEntryName2

                    text: "Rule: Light1\\nAction: Switched on"

                    font.pointSize: 18

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    //height: parent.height


                }
            }

            Text {
                id: detailsArrow2

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
*/

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
