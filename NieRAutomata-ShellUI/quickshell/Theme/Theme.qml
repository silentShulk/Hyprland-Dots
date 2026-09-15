pragma Singleton
import Quickshell
import QtQuick

Singleton {
    // Colors
    readonly property color bg: '#706857'
    readonly property color fg: '#d6cab2'
    readonly property color accent1: '#c76248'
    readonly property color accent2: '#6eb2a3'

    readonly property color bgDark: '#38342b'
    readonly property color fgDark: '#877a61'
    readonly property color accent1Dark: '#7a3625'
    readonly property color accent2Dark: '#395c54'

    // Typography
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

    // Style
    readonly property int radius: 16
}
