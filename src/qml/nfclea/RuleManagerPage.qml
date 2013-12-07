import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: ruleManagerPage
    tools: ruleTools
    anchors.margins: UiConstants.DefaultMargin

    Label {
        text: "Rule Manager Page"
        width: 100
        height: 100
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: ruleTools

        ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
        //ToolIcon { iconId: "toolbar-view-menu" ; onClicked: colorMenu.open(); }
    }
}
