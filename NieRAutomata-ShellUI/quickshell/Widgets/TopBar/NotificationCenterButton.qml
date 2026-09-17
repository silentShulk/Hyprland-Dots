import Quickshell
import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: notification

    square: true

    icon: SystemStats.notificationHistory.count > 0 ? "notifications_unread" : "notifications"
    
    iconBackground: false
    iconColor: Colors.fg
    iconFontSizeMultiplier: 2
    
    onBadgeClicked: Loaders.notificationsCenterLoader.active = !Loaders.notificationsCenterLoader.active
}