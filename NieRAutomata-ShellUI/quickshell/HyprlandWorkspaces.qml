import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

Rectangle {
    id: workspaces

    width: Theme.islandsWidth + Theme.islandsPadding * 2
    height: Theme.islandsHeight + Theme.islandsPadding * 2

    color: Theme.bg
    radius: Theme.islandsRadius

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: Theme.islandsPadding

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
