import QtQuick



// Power Button
Rectangle {
    id: power
    
    width: root.islandsHeight + root.islandsPadding*2
    height: root.islandsHeight + root.islandsPadding*2

    color: root.accentSecondary
    radius: root.islandsRadius
    
    Text {
        anchors.centerIn: parent
        
        text: "⏻"
        font.family: root.fontFamily
        font.weight: root.fontWeight
        font.pixelSize: root.fontSize*2
        
        color: root.main
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: { logoutMenu.visible = !logoutMenu.visible }
    }
}