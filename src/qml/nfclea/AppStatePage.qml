import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: appStatePage
    tools: appStateTools
    anchors.margins: UiConstants.DefaultMargin
    orientationLock: PageOrientation.LockPortrait

    property bool nfcAvailability: false
    property bool networkConnected: false
    property string host: ""

    function updateProperties() {
        nfcAvailability = nfcManager.isNfcAvailable();
        networkConnected = client.isClientConnected()
        host = client.getHostAddress()
    }

    function updateServerStateView() {
        networkConnected = client.isClientConnected()
        host = client.getHostAddress()

        serverState.text = networkConnected ? "Connected" :
                                              "Not connected"
        serverState.color = networkConnected ? "#000" : "#a41f1f"
        serverHost.text = networkConnected ? "Host: " + host : ""
        networkIcon.source = networkConnected ? "qrc:images/network.png" :
                                                "qrc:images/networkGrey.png"

        connectButton.visible = networkConnected ? false : true
    }

    Text {
        id: appStatePageTitle
        text: qsTr("App State")

        color: "#249ca4"
        font.pointSize: 35

        height: 80
        width: parent.width - 20

        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Item {
        id: nfcStateContainer

        width: parent.width - 20
        height: 70

        anchors.top: appStatePageTitle.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        Image {
            id: nfcIcon

            height: 60
            width: 60

            source: nfcAvailability ? "qrc:images/officialNfcLogo.png" :
                                                  "qrc:images/officialNfcLogoGrey.png"

            sourceSize.width: nfcIcon.height
            sourceSize.height: nfcIcon.width

            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            id: nfcState

            text: nfcAvailability ? "NFC is available" : "NFC is not available"
            font.pointSize: 18
            color: nfcAvailability ? "#000" : "#a41f1f"

            anchors.left: nfcIcon.right
            anchors.leftMargin: 15
            anchors.verticalCenter: nfcIcon.verticalCenter
        }

        Image {
            id: nfcStateRefreshButton

            source: "qrc:/images/refresh.png"

            height: 30
            width: 30
            sourceSize.width: nfcStateRefreshButton.width
            sourceSize.height: nfcStateRefreshButton.height

            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: nfcIcon.verticalCenter

            MouseArea {
                id: nfcStateRefreshButtonMouseArea
                anchors.fill: parent

                onClicked: {
                    nfcAvailability = nfcManager.isNfcAvailable()

                    nfcState.text = nfcAvailability ? "NFC is available" :
                                                      "NFC is not available"
                    nfcState.color = nfcAvailability ? "#000" : "#a41f1f"
                    nfcIcon.source = nfcAvailability ? "qrc:images/officialNfcLogo.png" :
                                                       "qrc:images/officialNfcLogoGrey.png"
                }
            }
        }
    }

    Item {
        id: serverStateContainer

        width: parent.width - 20
        height: 70

        anchors.top: nfcStateContainer.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        Image {
            id: networkIcon

            height: 60
            width: 60

            source: "qrc:images/network.png"

            sourceSize.width: networkIcon.width
            sourceSize.height: networkIcon.height

            anchors.verticalCenter: parent.verticalCenter
        }
        Item {
            id: hostDetails

            width: parent.width - networkIcon.width - 15
            height: 70

            anchors.verticalCenter: networkIcon.verticalCenter
            anchors.left: networkIcon.right
            anchors.leftMargin: 15

            Text {
                id: serverState
                color: "#000"

                text: networkConnected ? "Connected" : "Not connected"
                anchors.top: parent.top
                anchors.topMargin: 10
                wrapMode: Text.WrapAnywhere

                font.pointSize: 18
            }

            Text {
                id: serverHost

                text: "Host: " + host

                font.pointSize: 11

                anchors.top: serverState.bottom
                anchors.topMargin: 0
            }

            Image {
                id: networkStatusRefreshButton

                source: "qrc:/images/refresh.png"

                height: 30
                width: 30
                sourceSize.width: networkStatusRefreshButton.width
                sourceSize.height: networkStatusRefreshButton.height

                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10

                MouseArea {
                    id: networkStatusRefreshButtonMouseArea
                    anchors.fill: parent

                    onClicked: {
                        updateProperties()
                        updateServerStateView()
                    }
                }
            }

        }
    }

    Item {
        id: scoreContainer

        width: parent.width - 20
        height: 100

        anchors.top: serverStateContainer.bottom
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 10

        Text {
            id: scoreTitle

            text: "Score"

            color: "#249ca4"
            font.pointSize: 25
        }

        Column {
            id: scoreElements
            spacing: 10

            anchors.top: scoreTitle.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Text {
                id: numberOfRulesActivatedToday

                text: "Number of Rules activated today: 2"
                font.pointSize: 15
            }

            Text {
                id: numberOfRulesDefined

                text: "Number of Rules defined: 5"
                font.pointSize: 15
            }

            Text {
                id: numberOfTagTouched

                text: "NFC tags touched: 12"
                font.pointSize: 15
            }
        }

    }

    Button {
        id: connectButton

        text: qsTr("Connect")
        visible: networkConnected ? false : true

        onClicked: {
            client.reConnectToServer()
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: scoreContainer.bottom
            topMargin: 120
        }
    }

    Button {
        id: networkSettingsButton

        text: qsTr("Network Settings")
        visible: networkConnected ? false : true

        onClicked: {
            listPage.openFile("NetworkSettingsPage.qml")
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: connectButton.bottom
            topMargin: 20
        }
    }

    ToolBarLayout {
        id: appStateTools

        ToolIcon {
            iconId: "toolbar-back"
            onClicked: pageStack.pop()
            enabled: (appStateMenu.status === DialogStatus.Closed) ? true : false
        }
        ToolIcon {
            id: appStateToolbar
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (appStateMenu.status === DialogStatus.Closed) ? appStateMenu.open() :
                                                                       appStateMenu.close()
            visible: networkConnected ? true : false
        }
    }

    Menu {
        id: appStateMenu
        visualParent: appStatePage.parent
        MenuLayout {
            MenuItem {
                id: menuDisconnect
                text: qsTr("Disconnect")
                onClicked: {
                    client.disconnect()
                }
            }
        }
    }

    Component.onCompleted: {
        updateProperties()
        updateServerStateView()
    }

    Connections {
        target: client
        onConnectionStateChanged: {
            updateProperties()
            updateServerStateView()
        }
    }

    /* Solution with states
    states: [
        State {
            name: "NfcConnected"

            PropertyChanges {
                target: nfcIcon
                source: "qrc:images/nfcOfficialLogo.png"
            }

            PropertyChanges {
                target: nfcState
                text: "NFC is available"
                color: "#000"
            }
        },

        State {
            name: "NetworkConnected"

            PropertyChanges {
                target: networkIcon
                source: "qrc:images/network.png"
            }
            PropertyChanges {
                target: serverState
                text: "Connected"
                color: "#000"
            }
            PropertyChanges {
                target: serverHost
                text: "Host: " + client.getHostAddress()
            }
        }
    ]

    Component.onCompleted: {

    }
    */
}
