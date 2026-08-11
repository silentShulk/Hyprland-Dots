import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets



// Hyprland Workspaces
Rectangle {
    id: leftIsland

    width: root.islandsWidth
    height: leftLayout.implicitHeight + root.islandsPadding*2

    color: root.accentDark
    radius: root.islandsRadius
    
    RowLayout {
        id: leftLayout
        
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        
        anchors.leftMargin: root.islandsPadding
        spacing: 12

        IslandBadge {
            text: "O"
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
                            source: 
                            Quickshell.iconPath(
                                DesktopEntries.byId(
                                    modelData.wayland?.appId
                                ).icon
                            )
                        }
                    }
                }
            }
        }
    }
}