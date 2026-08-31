import Quickshell.Hyprland
import QtQuick

Item {
    id: shortcuts
    required property var appLauncherLoader

    GlobalShortcut {
        name: "toggle-app-launcher"
        description: "Toggle App Launcher"
        onPressed: {
            shortcuts.appLauncherLoader.active = !shortcuts.appLauncherLoader.active
        }
    }
}