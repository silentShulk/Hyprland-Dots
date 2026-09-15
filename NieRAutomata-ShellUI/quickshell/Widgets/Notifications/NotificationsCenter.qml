import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Layouts
import QtQuick.Controls

import "../Components"
import "../../Theme"

PanelWindow {
    id: notificationsCenter

    WlrLayershell.layer: WlrLayer.Overlay

    anchors {
        top: true
        right: true
        bottom: true
    }
    margins {
        top: 20
        right: 20
        bottom: 20
    }

    implicitWidth: 400

    color: "transparent"

    Rectangle {
        anchors.fill: parent

        color: Theme.bg
        radius: Theme.radius

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            spacing:25

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter

                spacing: 20

                Text {
                    Layout.alignment: Qt.AlignHCenter

                    text: "Notification Center"

                    font.family: Theme.fontFamily
                    font.weight: Font.Bold
                    font.pixelSize: Theme.fontSize * 2

                    color: Theme.fg
                }
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter

                    implicitWidth: notificationsCenter.width - notificationsCenter.width / 7.5
                    implicitHeight: 2

                    color: Theme.fg
                }
            }

            RowLayout {
                spacing: 10

                Text {
                    text: "Do not disturb"

                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize

                    Layout.alignment: Qt.AlignVCenter
                }

                Switch {
                    id: dndSwitch
                    checked: SystemStats.doNotDisturb
                    onToggled: SystemStats.doNotDisturb = checked

                    Layout.alignment: Qt.AlignVCenter

                    indicator: SwitchToggle {
                        checked: dndSwitch.checked
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                border.color: Theme.bgDark
                border.width: 2

                radius: Theme.radius
                color: "transparent"

                clip: true

                ScrollView {
                    id: notifScrollView

                    anchors.fill: parent
                    anchors.margins: 8

                    clip: true
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                    ColumnLayout {
                        width: notifScrollView.availableWidth
                        spacing: 10

                        Repeater {
                            model: SystemStats.notificationHistory
                            NotificationPopUp {
                                required property var modelData

                                onDismissed: SystemStats.removeFromHistory(modelData.notifId)
                            }
                        }
                    }
                }
            }

            IslandBadge {
                icon: "mark_chat_read"

                widthOverride: 48
                heightOverride: 48
                fontSizeMultiplier: 2

                onBadgeClicked: {
                    for (let i = SystemStats.notificationHistory.count - 1; i >= 0; i--) {
                        SystemStats.removeFromHistory(SystemStats.notificationHistory.get(i).notifId);
                    }
                }
            }
        }
    }
}
