import QtQuick
import QtQuick.Layouts



// Clock | Date
Rectangle {
    id: clock

    Layout.preferredWidth: root.islandsWidth
    Layout.preferredHeight: middleLayout.implicitHeight + root.islandsPadding*2

    color: root.accentDark
    radius: root.islandsRadius
    
    RowLayout {
        id: middleLayout
        
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

        spacing: 12

        IslandBadge {
            text: "O"
        }
        
        Text {
            text: root.currentTime 
            font.pixelSize: root.fontSize
            color: root.main
        }
        Text {
            text: "|"
            font.pixelSize: root.fontSize
            color: root.main
        }
        Text {
            text: root.date
            font.pixelSize: root.fontSize
            color: root.main
        }
    }
}