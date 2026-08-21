import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell

PanelWindow {
    id: appLauncher

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    
    readonly property int menuWidth: 512
    readonly property int menuRadius: 16
    readonly property int menuMargin: 16
    readonly property int menuPadding: 8
    readonly property int iconSize: 64
    readonly property var filteredApps: DesktopEntries.applications.values.filter(entry => 
        entry.name.toLowerCase().includes(searchInput.text.toLowerCase())
    )
    property int selectedIndex: 0

    anchors {
        left: true
    }
    
    implicitWidth: appLauncher.menuWidth
    implicitHeight: appLauncher.menuWidth
    
    color: "transparent"

    Rectangle {
        NumberAnimation on x {
            from: -appLauncher.menuWidth
            to: 0
            duration: 250
        }
        
        width: parent.width
        height: parent.height
        
        color: Theme.bg
        topRightRadius: appLauncher.menuRadius 
        bottomRightRadius: appLauncher.menuRadius 

        ColumnLayout {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            
            anchors.topMargin: appLauncher.menuMargin
            anchors.bottomMargin: appLauncher.menuMargin
            anchors.rightMargin: appLauncher.menuMargin

            spacing: appLauncher.menuMargin

            TextField {
                id: searchInput

                focus: true
                
                Layout.fillWidth: true
                Layout.preferredHeight: appLauncher.menuMargin * 2

                leftPadding: appLauncher.menuPadding

                Component.onCompleted: forceActiveFocus()
                onTextChanged: appLauncher.selectedIndex = 0
                
                placeholderText: "Search..."
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSize

                background: Rectangle {
                    height: appLauncher.entryHeight
                    
                    color: Theme.fg
                    topRightRadius: appLauncher.menuRadius - appLauncher.menuMargin/2
                    bottomRightRadius: appLauncher.menuRadius - appLauncher.menuMargin/2
                }

                Keys.onTabPressed: event => {
                    if (appLauncher.selectedIndex < appLauncher.filteredApps.length - 1)
                        appLauncher.selectedIndex = appLauncher.selectedIndex + 1;
                    event.accepted = true;
                }
                Keys.onBacktabPressed: event => {
                    if (appLauncher.selectedIndex > 0)
                        appLauncher.selectedIndex = appLauncher.selectedIndex - 1;
                    event.accepted = true;
                }

                // Keys.onDownPressed: event => {
                //     var count = appLauncher.filteredApps.length;
                //     if (count > 0) {
                //         appLauncher.selectedIndex = (appLauncher.selectedIndex + 1) % count;
                //     }
                //     event.accepted = true;
                // }
                // Keys.onUpPressed: event => {
                //     var count = appLauncher.filteredApps.length;
                //     if (count > 0) {
                //         appLauncher.selectedIndex = (appLauncher.selectedIndex - 1 + count) % count;
                //     }
                //     event.accepted = true;
                // }

                Keys.onEscapePressed: event => { appLauncherLoader.active = false}
                
                Keys.onReturnPressed: event => executeSelected()
                function executeSelected() {
                    if (appLauncher.filteredApps.length > 0) {
                        var app = appLauncher.filteredApps[appLauncher.selectedIndex];
                        app.execute(); 
                        appLauncherLoader.active = false; 
                    }
                }
            }
    
            ListView {
                id: appListView

                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true

                spacing: appLauncher.menuMargin
                model: appLauncher.filteredApps
                currentIndex: appLauncher.selectedIndex

                onCurrentIndexChanged: positionViewAtIndex(currentIndex, ListView.Contain)

                delegate: AppLauncherEntry {
                    appName: modelData.name
                    appIcon: modelData.icon
                    isHighlighted: index === appLauncher.selectedIndex
                }
            }
        }
    }

    NumberAnimation {
        target: slideTransform
        property: "x"
        from: -appLauncher.menuWidth // Starts off-screen (-512px)
        to: 0                        // Slides to resting position (0px)
        duration: 250                // Takes 250 milliseconds
        easing.type: Easing.OutCubic // Decelerates naturally
        running: true                // Plays immediately when opened
    }
}