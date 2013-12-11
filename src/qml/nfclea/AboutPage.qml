import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: aboutPage
    tools: aboutTools
    anchors.margins: UiConstants.DefaultMargin
    orientationLock: PageOrientation.LockPortrait

    /*
    ScrollDecorator {
        flickableItem: flickable
    }
    */

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: parent.height
        contentWidth: parent.width

        Item {
            id: appNameAndLogoContainer
            width: parent.width
            height: 150

            NfcLogo {
                id: appLogo
                height: 100
                width: 100

                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            Label {
                id: appName

                height: 60
                width: parent.width - appLogo.width - 25

                text: "NfcLEA"

                color: "#f8249ca4"
                font.pixelSize: 40

                anchors.left: appLogo.right
                anchors.leftMargin: 20
                anchors.verticalCenter: appLogo.verticalCenter
                anchors.verticalCenterOffset: -20
            }

            Label {
                id: appVersion

                height: 30
                width: appName.width

                text: "Version 0.2.0"

                color: "#000"
                font.pixelSize: 20

                anchors.top: appName.bottom
                anchors.topMargin: 0
                anchors.horizontalCenter: appName.horizontalCenter
            }
        }

        Item {
           id: appDescription

           width: parent.width
           height: 180

           anchors.top: appNameAndLogoContainer.bottom
           anchors.topMargin: 20

           Label {
               width: parent.width
               height: parent.height

               text: "This application is a proof of concept of a NFC assisted living " +
                     "environment automation. It has been developed as a Project Laboratory " +
                     "work at Budapest University of Technology and Economics. "

               wrapMode: Text.WordWrap
               horizontalAlignment: Text.AlignJustify

           }
        }

        Item {
            id: appLicense

            width: parent.width
            height: 130

            anchors.top: appDescription.bottom
            anchors.topMargin: 20

            Label {
                id: licenseLabel

                width: parent.width
                height: 20

                text: "This application is licensed under \nGPLv3+. " +
                      "If you need another type of license, please contact us."

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignJustify
            }
        }

        Item {
            id: appDeveloper

            width: parent.width
            height: 100

            anchors.top: appLicense.bottom
            anchors.topMargin: 20

            Label {
                id: developerLabel

                width: parent.width
                height: 20

                text: "Developer:"
            }

            Label {
                id: developerName

                width: parent.width
                height: 20

                text: "Tamás G. Barna"

                color: "#f8249ca4"

                anchors.top: developerLabel.bottom
                anchors.topMargin: 20
            }

            Label {
                id: developerContact

                width: parent.width
                height: 20

                text: "cremindes@sch.bme.hu"

                anchors.top: developerName.bottom
                anchors.topMargin: 10
            }
        }
    }

    ToolBarLayout {
        id: aboutTools

        ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
/*
        ToolIcon {
            iconId: "toolbar-view-menu" ;
            onClicked: (myMenu.status === DialogStatus.Closed) ? logMenu.open() : logMenu.close()
        }
*/
    }
/*
    Menu {
        id: logMenu
        visualParent: logPage
        MenuLayout {
            MenuItem { text: qsTr("Clear history") }
        }
    }
*/
}

