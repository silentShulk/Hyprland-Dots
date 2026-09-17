import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: workspaces

    icon: "apps"
    onBadgeClicked: Quickshell.execDetached(["missioncenter"])

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
                        readonly property string appIcon: DesktopEntries.byId(modelData.wayland?.appId)?.icon ?? ""
                        visible: appIcon !== ""
                        source: visible ? Quickshell.iconPath(appIcon) : ""
                    }
                }
            }
        }
    }
}