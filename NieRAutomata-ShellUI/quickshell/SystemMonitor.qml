import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: system

    width: topBar.islandsWidth + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    RowLayout {
        id: systemLayout

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: topBar.islandsPadding

        spacing: 12

        IslandBadge {
            text: "\u{F04C5}"

            onBadgeClicked: {
                Quickshell.execDetached(["missioncenter"]);
            }
        }

        RowLayout {
            spacing: 16

            Text {
                text: "\u{F035B} " + `${SystemStats.cpuUsage}%`
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
            Text {
                text: "\u{F0EC2} " + `${SystemStats.ramUsage}%`
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
            Text {
                text: "\u{F02CA} " + `${SystemStats.diskAvailability}% (${SystemStats.diskFreeSpace})`
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
        }
    }
}