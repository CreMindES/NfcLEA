import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: activeRulesPage
    tools: tabTools
    anchors.margins: UiConstants.DefaultMargin

    Label {
        text: "Active Rules:"
        width: 100
        height: 100
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: tabTools

        ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
        //ToolIcon { iconId: "toolbar-view-menu" ; onClicked: colorMenu.open(); }
    }
}
