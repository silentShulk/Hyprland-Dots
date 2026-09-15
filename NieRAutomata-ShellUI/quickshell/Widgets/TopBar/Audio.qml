import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Data"
import "../Components"
import "../../Theme"

Rectangle {
    id: audio

    width: audioLayout.width + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    RowLayout {
        id: audioLayout

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: topBar.islandsPadding

        spacing: 12

        IslandBadge {
            icon: if (SystemStats.volumePercent == 0)
                    return "volume_off"
                else if (SystemStats.volumePercent > 0 && SystemStats.volumePercent < 50)
                    return "volume_down"
                else
                    return "volume_up"

            onBadgeClicked: {
                Quickshell.execDetached(["pwvucontrol"]);
            }
        }

        RowLayout {
            spacing: 2
            Text {
                text: `${SystemStats.volumePercent}%`
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
        }
    }
}