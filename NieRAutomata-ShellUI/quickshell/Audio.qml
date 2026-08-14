import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: audio

    width: audioLayout.width + root.islandsPadding * 2
    height: root.islandsHeight + root.islandsPadding * 2

    color: root.bg
    radius: root.islandsRadius

    RowLayout {
        id: audioLayout

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

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
                text: `${root.volumePercent}%`
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize

                color: root.fg
            }
            Text {
                text: "🕪"
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize

                color: root.fg
            }
        }
    }
}
