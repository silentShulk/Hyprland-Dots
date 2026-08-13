import QtQuick



// Power Button
Rectangle {
    id: power
    
    width: powerButton.height
    height: powerButton.height

    color: root.accentSecondary
    radius: root.islandsRadius
    
    Text {
        id: powerButton

        anchors.centerIn: parent
        
        text: "⏻"
        font.pixelSize: root.fontSize*2
        
        color: root.main
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: { logoutMenu.visible = !logoutMenu.visible }
    }
}