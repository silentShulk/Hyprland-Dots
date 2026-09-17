import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Layouts
import QtQuick.Controls

import "../../Data"
import "../Components"
import "../../Theme"

PanelWindow {
    id: notificationsCenter

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore

    anchors {
        top: true
        right: true
        bottom: true
    }
    margins {
        top: 80
        right: 20
        bottom: 20
    }

    implicitWidth: 400

    color: "transparent"

    Rectangle {
        anchors.fill: parent

        color: Colors.bg
        radius: Style.radius

        border.width: 5
        border.color: Colors.bgDark

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

                    font.family: Typography.fontFamily
                    font.weight: Font.Bold
                    font.pixelSize: Typography.fontSize * 2

                    color: Colors.fg
                }
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter

                    implicitWidth: notificationsCenter.width - notificationsCenter.width / 7.5
                    implicitHeight: 2

                    color: Colors.fg
                }
            }

            RowLayout {
                spacing: 10

                Text {
                    text: "Do not disturb"

                    font.family: Typography.fontFamily
                    font.weight: Typography.fontWeight
                    font.pixelSize: Typography.fontSize

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
                
                border.color: Colors.bgDark
                border.width: 2

                radius: Style.radius
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

                                notifId: modelData.notifId
                                summary: modelData.summary
                                body: modelData.body
                                appIcon: modelData.appIcon
                                image: modelData.image

                                onDismissed: SystemStats.removeFromHistory(modelData.notifId)
                            }
                        }
                    }
                }
            }

            IslandBadge {
                icon: "mark_chat_read"

                preferredWidth: 48
                preferredHeight: 48
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
