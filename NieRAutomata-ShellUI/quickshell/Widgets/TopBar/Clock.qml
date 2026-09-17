import QtQuick
import QtQuick.Layouts

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: clockdate

    icon: "calendar_month"
    onBadgeClicked: calendarPopup.visible = !calendarPopup.visible
    
    RowLayout {
        spacing: 8

        Text {
            text: SystemStats.currentTime
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
        Text {
            text: "|"
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
        Text {
            text: SystemStats.date
            font.family: Typography.fontFamily
            font.weight: Typography.fontWeight
            font.pixelSize: Typography.fontSize

            color: Colors.fg
        }
    }
}