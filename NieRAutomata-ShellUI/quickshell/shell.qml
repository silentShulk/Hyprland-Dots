import Quickshell
import QtQuick

ShellRoot {
    id: root

    TopBar {}
    Calendar { id: calendarPopup }

    Loader {
        id: notificationLoader
        active: SystemStats.server.trackedNotifications.values.length > 0
        source: "Notification.qml"
    }

    Loader {
        id: appLauncherLoader
        active: false
        source: "AppLauncher.qml"
    }

    Shortcuts {
        appLauncherLoader: appLauncherLoader
    }

    CavaVisualizer {}
    LogoutMenu { id: logoutMenu }
}