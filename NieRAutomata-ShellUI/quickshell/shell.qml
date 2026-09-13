import Quickshell
import QtQuick

ShellRoot {
    id: root

    Shortcuts {
        appLauncherLoader: appLauncherLoader
        notificationsCenterLoader: notificationsCenterLoader
    }

    TopBar {}
    Calendar { id: calendarPopup }

    Loader {
        id: notificationsLoader
        active: SystemStats.server.trackedNotifications.values.length > 0
        source: "NotificationsManager.qml" 
    }
    Loader {
        id: notificationsCenterLoader
        active: false
        source: "NotificationsCenter.qml"
    }

    Loader {
        id: appLauncherLoader
        active: false
        source: "AppLauncher.qml"
    }

    CavaVisualizer {}
    
    LogoutMenu { id: logoutMenu }
}