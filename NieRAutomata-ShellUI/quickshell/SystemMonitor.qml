import QtQuick
import QtQuick.Layouts



Rectangle {
    id: rightIsland

    Layout.preferredWidth: root.islandsWidth
    Layout.preferredHeight: rightLayout.implicitHeight + root.islandsPadding*2

    color: root.accentDark
    radius: root.islandsRadius
    
    RowLayout {
        id: rightLayout
        
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: root.islandsPadding

        spacing: 12

        IslandBadge {
            text: "O"
        }

        RowLayout {
            spacing: 2
            Text {
                text: `${root.volumePercent}%`
                font.pixelSize: root.fontSize
                color: root.main
            }
            Text {
                text: "🕪"
                font.pixelSize: root.fontSize
                color: root.main
            }
        }

        Text {
            text: "|"
            font.pixelSize: root.fontSize
            color: root.main
        }

        RowLayout {
            spacing: 8
            
            Text {
                text: `${root.cpuUsage}%`
                font.pixelSize: root.fontSize
                color: root.main
            }
            Text {
                text: `${root.ramUsage}%`
                font.pixelSize: root.fontSize
                color: root.main
            }
            Text {
                text: `${root.diskAvailability}% (${root.diskFreeSpace})`
                font.pixelSize: root.fontSize
                color: root.main
            }
        }
    }
}