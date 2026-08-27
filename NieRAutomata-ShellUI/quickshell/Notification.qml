import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets

PanelWindow {
    WlrLayershell.layer: WlrLayer.Overlay
    
    anchors {
        left: true
        top: true
    }

    implicitWidth: 350
    implicitHeight: 420

    color: "transparent"
    
    Column {
        anchors.fill: parent
        anchors.margins: 16

        spacing: 8

        Repeater {
            model: [...SystemStats.server.trackedNotifications.values].reverse()

            delegate: Rectangle {
                implicitWidth: 318
                implicitHeight: 128
                 
                color: Theme.bg
                radius: Theme.radius

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    
                    spacing: 12
                    
                    RowLayout {
                        IconImage {
                            source: modelData.appIcon
                            Layout.preferredWidth: 32
                            Layout.preferredHeight: 32
                        }
    
                        Text {
                            text: modelData.summary
                            
                            Layout.fillWidth: true
                            
                            font.bold: true
                            font.pixelSize: Theme.fontSize
                            wrapMode: Text.Wrap
                            
                            color: Theme.fg
                        }
                    }

                    Text {
                        text: modelData.body
                        Layout.fillWidth: true
                        color: Theme.fg
                        wrapMode: Text.Wrap
                    }

                    RowLayout {
                        Repeater {
                            model: modelData.actions
    
                            Text {
                                text: modelData.text
                            }
                        }
                    }
                }

                Rectangle {
                    anchors.top: parent.top
                    anchors.right: parent.right

                    anchors.margins: 8
                    
                    implicitWidth: 24
                    implicitHeight: 24

                    color: Theme.accent1
                    radius: implicitWidth /2

                    Text {
                        anchors.centerIn: parent
                        text: "\u{2715}"
                        font.pixelSize: Theme.fontSize
                    }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: modelData.dismiss()
                    }
                }

                Timer {
                    interval: {
                        if (modelData.expireTimeout > 0) return modelData.expireTimeout
                        if (modelData.expireTimeout === -1) return 3000
                        return 0
                    }
                    running: interval > 0
                    repeat: false
                    onTriggered: modelData.expire()
                }
            }
        }
    }
}