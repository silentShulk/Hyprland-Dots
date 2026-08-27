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
            Layout.preferredWidth: 128
            Layout.preferredHeight: 256

            color: logoutMouseArea.containsMouse ? Theme.fgDark : Theme.fg
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter

                    text: "\u{F0343}"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter

                    text: "Logout"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 3
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
            Layout.preferredWidth: 128
            Layout.preferredHeight: 256

            color: rebootMouseArea.containsMouse ? Theme.accent2Dark : Theme.accent2
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "\u{F0709}"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Reboot"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 3
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
            Layout.preferredWidth: 128
            Layout.preferredHeight: 256

            color: shutdownMouseArea.containsMouse ? Theme.accent1Dark : Theme.accent1
            radius: 32

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 8
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "⏻"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 4
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Shutdown"
                    font.family: Theme.fontFamily
                    font.weight: Theme.fontWeight
                    font.pixelSize: Theme.fontSize * 3
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
