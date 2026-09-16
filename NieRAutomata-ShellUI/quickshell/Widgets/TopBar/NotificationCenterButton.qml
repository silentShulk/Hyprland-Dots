import Quickshell
import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: notification

    preferredWidth: topBar.islandsHeight
    square: true

    IslandBadge {
        icon: SystemStats.notificationHistory.count > 0 ? "notifications_unread" : "notifications"
        
        background: false
        iconColor: Colors.fg
        fontSizeMultiplier: 2
    }
    
    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Loaders.notificationsCenterLoader.active = !Loaders.notificationsCenterLoader.active
        }
    }
}