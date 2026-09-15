import Quickshell.Hyprland
import QtQuick
import Quickshell
pragma Singleton

Singleton {
    id: shortcuts

    GlobalShortcut {
        name: "toggle-app-launcher"
        description: "Toggle App Launcher"
        onPressed: {
            Loaders.appLauncherLoader.active = !Loaders.appLauncherLoader.active
        }
    }

    GlobalShortcut {
        name: "toggle-notifications-center"
        description: "Toggle notifications center"
        onPressed: {
            Loaders.notificationsCenterLoader.active = !Loaders.notificationsCenterLoader.active
        }
    }
}