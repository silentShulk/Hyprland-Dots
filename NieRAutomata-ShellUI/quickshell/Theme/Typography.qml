pragma Singleton
import Quickshell
import QtQuick

Singleton {
    readonly property string fontFamily: "JetBrainsMono Nerd Font Propo"
    readonly property string iconFontFamily: "Material Symbols Rounded"
    readonly property int fontWeight: Font.Medium
    readonly property int fontSize: 14
    readonly property int iconFontSize: 16
    readonly property var iconAxes: ({
        "FILL": 0,      // 0 outlined, 1 solid
        "wght": 700,    // 100 thin, 700 bold
        "GRAD": 0,      // -25 not emphasized, 200 emphasized
        "opsz": 200     // proportions based on font size
    })
}