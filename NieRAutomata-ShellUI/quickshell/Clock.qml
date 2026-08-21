import QtQuick
import QtQuick.Layouts

Rectangle {
    id: clockdate

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
            text: "\uf073"

            onBadgeClicked: {
                calendarPopup.visible = !calendarPopup.visible;
            }
        }

        RowLayout {
            spacing: 8

            Text {
                text: SystemStats.currentTime
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
            Text {
                text: "|"
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
            Text {
                text: SystemStats.date
                font.family: Theme.fontFamily
                font.weight: Theme.fontWeight
                font.pixelSize: Theme.fontSize

                color: Theme.fg
            }
        }
    }
}
