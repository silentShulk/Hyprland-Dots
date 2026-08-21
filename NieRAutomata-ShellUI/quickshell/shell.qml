import Quickshell
import QtQuick
import Quickshell.Hyprland

ShellRoot {
    id: root

    TopBar {}
    Calendar {
        id: calendarPopup
    }

    Loader {
        id: appLauncherLoader

        active: false
        source: "AppLauncher.qml"
    }
    GlobalShortcut {
        name: "toggle-app-launcher"
        description: "Toggle App Launcher"

        onPressed: {
            appLauncherLoader.active = !appLauncherLoader.active
        }
    }

    CavaVisualizer {}

    LogoutMenu {
        id: logoutMenu
    }
}
