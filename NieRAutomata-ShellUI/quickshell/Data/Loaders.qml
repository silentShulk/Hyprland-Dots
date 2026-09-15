pragma Singleton
import QtQuick
import Quickshell

Singleton {
    property alias topBarLoader: topBarLoader
    property alias cavaLoader: cavaLoader
    property alias logoutMenuLoader: logoutMenuLoader
    property alias notificationsLoader: notificationsLoader
    property alias notificationsCenterLoader: notificationsCenterLoader
    property alias appLauncherLoader: appLauncherLoader

    Loader { id: topBarLoader; active: true; source: "../Widgets/TopBar/TopBar.qml" }
    Loader { id: cavaLoader; active: true; source: "../Widgets/Cava/CavaVisualizer.qml" }
    Loader { id: logoutMenuLoader; active: true; source: "../Widgets/LogoutMenu/LogoutMenu.qml" }
    Loader { id: notificationsLoader; active: true; source: "../Widgets/Notifications/NotificationsManager.qml" }
    Loader { id: notificationsCenterLoader; active: false; source: "../Widgets/Notifications/NotificationsCenter.qml" }
    Loader { id: appLauncherLoader; active: false; source: "../Widgets/AppLauncher/AppLauncher.qml" }
}