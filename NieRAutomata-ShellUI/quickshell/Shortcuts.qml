import Quickshell.Hyprland
import QtQuick

Item {
    id: shortcuts
    required property var appLauncherLoader
    required property var notificationsCenterLoader

    GlobalShortcut {
        name: "toggle-app-launcher"
        description: "Toggle App Launcher"
        onPressed: {
            shortcuts.appLauncherLoader.active = !shortcuts.appLauncherLoader.active
        }
    }

    GlobalShortcut {
        name: "toggle-notifications-center"
        description: "Toggle notifications center"
        onPressed: {
            shortcuts.notificationsCenterLoader.active = !shortcuts.notificationsCenterLoader.active
        }
    }
}