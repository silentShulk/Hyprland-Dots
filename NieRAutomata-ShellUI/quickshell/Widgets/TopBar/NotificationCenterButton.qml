import Quickshell
import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

Rectangle {
    id: notification

    width: topBar.islandsHeight + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    IslandBadge {
        anchors.centerIn: parent
        
        icon: SystemStats.notificationHistory.count > 0 ? "notifications_unread" : "notifications"
        
        background: false
        iconColor: Theme.fg
        fontSizeMultiplier: 2
    }
    
    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            
        }
    }
}