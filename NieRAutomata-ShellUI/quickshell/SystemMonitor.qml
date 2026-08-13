import Quickshell
import QtQuick
import QtQuick.Layouts



Rectangle {
    id: system

    width: root.islandsWidth + root.islandsPadding*2
    height: root.islandsHeight + root.islandsPadding*2

    color: root.accentDark
    radius: root.islandsRadius
    
    RowLayout {
        id: systemLayout
        
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

        spacing: 12

        IslandBadge {
            text: "\u{F04C5}"

            onBadgeClicked: { Quickshell.execDetached(["ghostty", "-e", "btm"]) }
        }

        RowLayout {
            spacing: 16
            
            Text {
                text: "\u{F035B} " + `${root.cpuUsage}%`
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize
                
                color: root.main
            }
            Text {
                text: "\u{F0EC2} " + `${root.ramUsage}%`
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize
                
                color: root.main
            }
            Text {
                text: "\u{F02CA} " + `${root.diskAvailability}% (${root.diskFreeSpace})`
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize
                
                color: root.main
            }
        }
    }
}