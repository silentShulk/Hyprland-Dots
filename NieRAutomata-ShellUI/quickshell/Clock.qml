import QtQuick
import QtQuick.Layouts

Rectangle {
    id: clockdate

    width: root.islandsWidth + root.islandsPadding * 2
    height: root.islandsHeight + root.islandsPadding * 2

    color: root.bg
    radius: root.islandsRadius

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

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
                text: root.currentTime
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize

                color: root.fg
            }
            Text {
                text: "|"
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize

                color: root.fg
            }
            Text {
                text: root.date
                font.family: root.fontFamily
                font.weight: root.fontWeight
                font.pixelSize: root.fontSize

                color: root.fg
            }
        }
    }
}
