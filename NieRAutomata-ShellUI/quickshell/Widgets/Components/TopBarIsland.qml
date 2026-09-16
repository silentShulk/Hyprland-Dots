import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import "../../Theme"

WrapperRectangle {
    id: island

    // Inner Padding
    leftMargin: Style.padding
    rightMargin: Style.padding
    topMargin: Style.padding
    bottomMargin: Style.padding

    color: Colors.bg
    radius: Style.radius 

    required property int preferredWidth
    property int defaultHeight: 40
    property bool square

    implicitWidth: square ? defaultHeight : preferredWidth
    implicitHeight: defaultHeight

    default property alias content: row.data

    RowLayout {
        id: row
        spacing: Style.margin
    }
}