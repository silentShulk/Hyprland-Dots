import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
pragma ComponentBehavior: Bound

import "../../Data"
import "../Components"
import "../../Theme"

PanelWindow {
    id: notificationsManager

    WlrLayershell.layer: WlrLayer.Overlay

    anchors {
        top: true
        left: true
    }
    margins {
        top: 20
        left: 20
    }

    implicitWidth: notifications.width
    implicitHeight: notifications.height

    color: "transparent"

    ColumnLayout {
        id: notifications

        spacing: 10

        Repeater {
            model: [...SystemStats.server.trackedNotifications.values].reverse()

            NotificationPopUp {
                id: notification
                required property var modelData

                notifId: modelData.id
                summary: modelData.summary
                body: modelData.body
                appIcon: modelData.appIcon
                image: modelData.image

                onDismissed: modelData.dismiss()

                Timer {
                    interval: {
                        if (notification.modelData.expireTimeout > 0) return notification.modelData.expireTimeout
                        if (notification.modelData.expireTimeout === -1) return 3000
                        return 0
                    }
                    running: interval > 0
                    repeat: false
                    onTriggered: notification.modelData.expire()
                }
            }
        }
    }
}