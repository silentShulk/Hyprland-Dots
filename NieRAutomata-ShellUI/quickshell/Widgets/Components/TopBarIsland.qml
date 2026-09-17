import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import "../../Theme"

WrapperRectangle {
    id: island

    readonly property int defaultPreferredWidth: 256
    
    property int preferredWidth: 256
    property int defaultHeight: 40
    property bool square: false

    required property string icon
    
    property color iconColor: "black"
    property int preferredIconWidth: 24
    property int preferredIconHeight: 24
    property bool iconBackground: true
    property color backgroundIconColor: Colors.fg
    property real iconFontSizeMultiplier: 1
    property int preferredIconRadius: Style.radius - Style.padding
    signal badgeClicked()
    
    // Inner Padding
    leftMargin: Style.padding
    rightMargin: Style.padding
    topMargin: Style.padding
    bottomMargin: Style.padding

    color: Colors.bg
    radius: Style.radius 
    
    implicitWidth: square ? defaultHeight : preferredWidth
    implicitHeight: defaultHeight

    default property alias content: row.data

    RowLayout {
        id: row
        spacing: Style.margin

        IslandBadge {
            icon: island.icon
            iconColor: island.iconColor
            preferredWidth: island.preferredIconWidth
            preferredHeight: island.preferredIconHeight
            background: island.iconBackground
            backgroundColor: island.backgroundIconColor
            fontSizeMultiplier: island.iconFontSizeMultiplier
            preferredRadius: island.preferredIconRadius
            onBadgeClicked: island.badgeClicked()
        }
    }
}