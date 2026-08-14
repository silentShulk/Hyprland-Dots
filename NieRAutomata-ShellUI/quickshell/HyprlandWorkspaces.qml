import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

Rectangle {
    id: workspaces

    width: root.islandsWidth + root.islandsPadding * 2
    height: root.islandsHeight + root.islandsPadding * 2

    color: root.bg
    radius: root.islandsRadius

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

        spacing: 12

        IslandBadge {
            text: "\u{F0BAB}"

            onBadgeClicked: {
                Quickshell.execDetached(["missioncenter"]);
            }
        }

        RowLayout {
            spacing: 16

            Repeater {
                model: Hyprland.workspaces

                RowLayout {
                    spacing: 4

                    Repeater {
                        model: modelData.toplevels

                        IconImage {
                            implicitSize: 16
                            source: Quickshell.iconPath(DesktopEntries.byId(modelData.wayland?.appId).icon)
                        }
                    }
                }
            }
        }
    }
}
