import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

Rectangle {
    id: power

    width: topBar.islandsHeight + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.accent1
    radius: topBar.islandsRadius

    IslandBadge {
        anchors.centerIn: parent
        
        icon: "settings_power"
        
        background: false
        iconColor: Theme.fg
        fontSizeMultiplier: 2
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            logoutMenu.visible = !logoutMenu.visible;
        }
    }
}