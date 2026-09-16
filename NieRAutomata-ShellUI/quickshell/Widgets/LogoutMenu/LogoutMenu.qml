import Quickshell
import QtQuick
import QtQuick.Layouts

import "../Components"
import "../../Theme"

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
            Layout.preferredWidth: 256
            Layout.preferredHeight: 512

            color: logoutMouseArea.containsMouse ? Colors.fgDark : Colors.fg
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 100
                
                IslandBadge {
                    Layout.alignment: Qt.AlignHCenter
                    icon: "logout"
                    
                    background: false
                    fontSizeMultiplier: 10
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Logout"
                    
                    font.family: Typography.fontFamily
                    font.weight: Typography.fontWeight
                    font.pixelSize: Typography.fontSize * 3
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
            Layout.preferredWidth: 256
            Layout.preferredHeight: 512

            color: rebootMouseArea.containsMouse ? Colors.accent2Dark : Colors.accent2
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 100
                
                IslandBadge {
                    Layout.alignment: Qt.AlignHCenter
                    icon: "rotate_left"
                    
                    background: false
                    fontSizeMultiplier: 10
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Reboot"
                    
                    font.family: Typography.fontFamily
                    font.weight: Typography.fontWeight
                    font.pixelSize: Typography.fontSize * 3
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
            Layout.preferredWidth: 256
            Layout.preferredHeight: 512

            color: shutdownMouseArea.containsMouse ? Colors.accent1Dark : Colors.accent1
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 100
                
                IslandBadge {
                    Layout.alignment: Qt.AlignHCenter
                    icon: "power_settings_circle"
                    
                    background: false
                    fontSizeMultiplier: 10
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Shutdown"
                    
                    font.family: Typography.fontFamily
                    font.weight: Typography.fontWeight
                    font.pixelSize: Typography.fontSize * 3
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
