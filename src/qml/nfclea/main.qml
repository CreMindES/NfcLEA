import QtQuick 1.1
import com.nokia.meego 1.1
//import Nfc 1.0

PageStackWindow {
    id: appWindow

    initialPage: MainPage { }

    platformStyle: PageStackWindowStyle { id: defaultStyle }

    // These tools are shared by most sub-pages by assigning the id to a page's tools property
    ToolBarLayout {
        id: commonTools
        visible: false
        ToolIcon { iconId: "toolbar-back"; onClicked: { myMenu.close(); pageStack.pop(); } }
        ToolIcon { iconId: "toolbar-view-menu"; onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close() }
    }
}
