import Quickshell
import QtQuick

Rectangle {
    id: notification

    width: topBar.islandsHeight + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    IslandBadge {
        anchors.centerIn: parent
        
        icon: SystemStats.server.trackedNotifications.values.length > 0 ? "notifications_unread" : "notifications"
        
        background: false
        iconColor: Theme.fg
        fontSizeMultiplier: 2
    }
    
    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Quickshell.execDetached(["swaync-client", "-t"]);
        }
    }
}