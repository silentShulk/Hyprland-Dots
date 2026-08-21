import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell

Rectangle {
    id: appEntry
    
    property string appName
    property string appIcon
    property bool isHighlighted

    width: appLauncher.menuWidth - appLauncher.menuMargin
    height: entryContent.implicitHeight + (appLauncher.menuPadding *2)

    color: isHighlighted ? Theme.bgDark : Theme.bg
    border.color: isHighlighted ? Theme.fg : "transparent"
    border.width: 2
    topRightRadius: appLauncher.menuRadius - appLauncher.menuMargin/2
    bottomRightRadius: appLauncher.menuRadius - appLauncher.menuMargin/2

    RowLayout {
        id: entryContent
        
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: appLauncher.menuPadding
        
        spacing: appLauncher.menuMargin
        
        Rectangle {
            implicitWidth: appLauncher.iconSize + appLauncher.menuPadding *2
            implicitHeight: appLauncher.iconSize + appLauncher.menuPadding *2

            color: Theme.fg
            radius: appLauncher.menuRadius
            
            IconImage {
                Layout.alignment: Qt.AlignVCenter
                anchors.centerIn: parent
                
                source: Quickshell.iconPath(appEntry.appIcon, "application-x-executable")
                
                implicitSize: appLauncher.iconSize
            }
        }

        Text {
            Layout.alignment: Qt.AlignVCenter
            
            text: appEntry.appName
            
            color: Theme.fg
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize *2
        }
    }
}