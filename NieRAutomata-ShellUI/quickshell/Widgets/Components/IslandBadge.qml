import QtQuick

import "../../Theme"

Rectangle {
    id: badge

    required property string icon
    
    property color iconColor: "black"
    property bool background: true
    property color backgroundColor: Colors.fg
    property real fontSizeMultiplier: 1
    property int preferredWidth: 24
    property int preferredHeight: 24
    
    signal badgeClicked(var mouse)

    implicitWidth: preferredWidth
    implicitHeight: preferredHeight

    color: background ? (mouseArea.containsMouse ? Colors.darkVariant(backgroundColor) : backgroundColor) : "transparent"
    radius: Style.radius - Style.padding

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