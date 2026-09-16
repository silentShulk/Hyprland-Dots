import Quickshell
import QtQuick

import "./Data"
import "./Widgets/AppLauncher"
import "./Widgets/Cava"
import "./Widgets/Components"
import "./Widgets/LogoutMenu"
import "./Widgets/Notifications"
import "./Widgets/TopBar"

ShellRoot {
    id: root

    property var loaders: Loaders
    property var shortcuts: Shortcuts
}