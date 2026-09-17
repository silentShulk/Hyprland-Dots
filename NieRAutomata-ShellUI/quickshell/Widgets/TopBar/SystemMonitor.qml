import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: system

    icon: "speed"
    onBadgeClicked: Quickshell.execDetached(["missioncenter"])
    
    RowLayout {
        spacing: 16

        Text {
            text: "\u{F035B} " + `${SystemStats.cpuUsage}%`
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
        Text {
            text: "\u{F0EC2} " + `${SystemStats.ramUsage}%`
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
        Text {
            text: "\u{F02CA} " + `${SystemStats.diskFreeSpace}` + "GB"
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
    }
}