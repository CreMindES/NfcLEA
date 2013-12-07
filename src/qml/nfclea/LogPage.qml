import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: logPage
    tools: historyTools
    anchors.margins: UiConstants.DefaultMargin

    Label {
        text: "History"
        width: 100
        height: 100
        anchors.centerIn: parent
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
