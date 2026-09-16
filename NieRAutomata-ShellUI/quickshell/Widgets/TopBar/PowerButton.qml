import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: power

    preferredWidth: topBar.islandsHeight
    square: true
    
    color: Colors.accent1

    IslandBadge {
        icon: "settings_power"
        
        background: false
        iconColor: Colors.fg
        fontSizeMultiplier: 2
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Loaders.logoutMenuLoader.active = !Loaders.logoutMenuLoader.active
        }
    }
}