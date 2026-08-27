import Quickshell
import QtQuick

ShellRoot {
    id: root

    Loader {
        id: notificationLoader
        active: SystemStats.server.trackedNotifications.values.length > 0
        source: "Notification.qml"
    }

    TopBar {}
    Calendar { id: calendarPopup }

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