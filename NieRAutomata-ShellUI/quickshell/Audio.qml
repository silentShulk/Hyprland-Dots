import Quickshell
import QtQuick
import QtQuick.Layouts

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
            text: "\u{F057E}"

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
            Text {
                text: "🕪"
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
        }
    }
}