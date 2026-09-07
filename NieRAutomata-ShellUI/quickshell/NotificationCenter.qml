import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    WlrLayershell.layer: WlrLayer.Overlay

    anchors {
        top: true
        left: true
    }
    margins {
        top: 10
    }

    implicitWidth: notifications.width
    implicitHeight: notifications.height

    color: "transparent"

    ColumnLayout {
        id: notifications

        Repeater {
            model: [...SystemStats.server.trackedNotifications.values].reverse()

            NotificationPopUp {
                required property var modelData
                receivedNotification: modelData
            }
        }
    }
}