import QtQuick

import "../../Theme"

Rectangle {
    id: badge

    required property string icon
    
    property color iconColor: "black"
    property int preferredWidth: 24
    property int preferredHeight: 24
    property bool background: true
    property color backgroundColor: Colors.fg
    property real fontSizeMultiplier: 1
    property int preferredRadius: Style.radius - Style.padding
    
    signal badgeClicked(var mouse)

    implicitWidth: preferredWidth
    implicitHeight: preferredHeight

    color: background ? (mouseArea.containsMouse ? Colors.darkVariant(backgroundColor) : backgroundColor) : "transparent"
    radius: preferredRadius

    Text {
        anchors.centerIn: parent
        
        text: badge.icon
        color: badge.iconColor
        
        font.family: Typography.iconFontFamily
        font.variableAxes: Typography.iconAxes
        font.pixelSize: Typography.iconFontSize * badge.fontSizeMultiplier
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: mouse => badge.badgeClicked(mouse)
    }
}