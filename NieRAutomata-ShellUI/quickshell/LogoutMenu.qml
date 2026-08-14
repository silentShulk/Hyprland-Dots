import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    visible: false

    color: "#cc000000"

    RowLayout {
        anchors.centerIn: parent

        spacing: 128

        // Logout
        Rectangle {
            Layout.preferredWidth: root.islandsWidth
            Layout.preferredHeight: root.islandsWidth * 2

            color: logoutMouseArea.containsMouse ? root.fgDark : root.fg
            radius: root.islandsRadius * 2

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter

                    text: "\u{F0343}"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter

                    text: "Logout"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 3
                }
            }

            MouseArea {
                id: logoutMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    Quickshell.execDetached(["hyprshutdown"]);
                }
            }
        }

        // Reboot
        Rectangle {
            Layout.preferredWidth: root.islandsWidth
            Layout.preferredHeight: root.islandsWidth * 2

            color: rebootMouseArea.containsMouse ? root.accent2Dark : root.accent2
            radius: root.islandsRadius * 2

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "\u{F0709}"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Reboot"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 3
                }
            }

            MouseArea {
                id: rebootMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    Quickshell.execDetached(["systemctl", "reboot"]);
                }
            }
        }

        // Shutdown
        Rectangle {
            Layout.preferredWidth: root.islandsWidth
            Layout.preferredHeight: root.islandsWidth * 2

            color: shutdownMouseArea.containsMouse ? root.accent1Dark : root.accent1
            radius: root.islandsRadius * 2

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "⏻"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Shutdown"
                    font.family: root.fontFamily
                    font.weight: root.fontWeight
                    font.pixelSize: root.fontSize * 3
                }
            }

            MouseArea {
                id: shutdownMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    Quickshell.execDetached(["systemctl", "poweroff"]);
                }
            }
        }
    }
}
