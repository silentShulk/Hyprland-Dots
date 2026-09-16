import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: audio

    preferredWidth: topBar.islandsWidth / 3

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
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
    }
}