import QtQuick
import QtQuick.Layouts

Rectangle {
    id: clockdate

    width: topBar.islandsWidth + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: topBar.islandsPadding

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