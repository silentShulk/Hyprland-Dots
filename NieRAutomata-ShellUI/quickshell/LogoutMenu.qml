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

            color: logoutMouseArea.containsMouse ? root.mainDark : root.main
            radius: root.islandsRadius * 2
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 4
                    text: "\u{F0343}"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 3
                    text: "Logout"
                }
            }

            MouseArea {
                id: logoutMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: { Quickshell.execDetached(["hyprshutdown"]) }
            }
        }

        // Reboot
        Rectangle {
            Layout.preferredWidth: root.islandsWidth
            Layout.preferredHeight: root.islandsWidth * 2

            color: rebootMouseArea.containsMouse ? root.accentTertiaryDark : root.accentTertiary
            radius: root.islandsRadius * 2
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 4
                    text: "\u{F0709}"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 3
                    text: "Reboot"
                }
            }

            MouseArea {
                id: rebootMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: { Quickshell.execDetached(["systemctl", "reboot"]) }
            }
        }

        // Shutdown
        Rectangle {
            Layout.preferredWidth: root.islandsWidth
            Layout.preferredHeight: root.islandsWidth * 2

            color: shutdownMouseArea.containsMouse ? root.accentSecondaryDark : root.accentSecondary
            radius: root.islandsRadius * 2
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 4
                    text: "\u{F0425}"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: root.fontSize * 3
                    text: "Shutdown"
                }
            }

            MouseArea {
                id: shutdownMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: { Quickshell.execDetached(["systemctl", "poweroff"]) }
            }
        }
    }
}