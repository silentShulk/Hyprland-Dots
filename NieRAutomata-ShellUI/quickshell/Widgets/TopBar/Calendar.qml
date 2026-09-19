pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import "../../Data"
import "../Components"
import "../../Theme"

PanelWindow {
    id: calendar

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore

    visible: false

    anchors {
        top: true
    }
    margins {
        top: topBar.barHeight + Style.margin
    }

    implicitWidth: 256
    implicitHeight: 384

    color: "transparent"

    property var currentDate: new Date()
    property int selectedMonth: currentDate.getMonth()
    property int selectedYear: currentDate.getFullYear()

    Rectangle {
        anchors.fill: parent

        color: Qt.rgba(Colors.bg.r, Colors.bg.g, Colors.bg.b, 0.75)
        radius: Style.radius

        border.color: Colors.fg
        border.width: 2

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16

            spacing: 8

            RowLayout {
                Rectangle {
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24

                    color: "transparent"
                    radius: Style.radius

                    Text {
                        anchors.centerIn: parent

                        text: "‹"
                        font.family: Typography.fontFamily
                        font.pixelSize: Typography.fontSize * 2

                        color: Colors.accent1
                    }

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (calendar.selectedMonth === 0) {
                                calendar.selectedMonth = 11;
                                calendar.selectedYear -= 1;
                            } else {
                                calendar.selectedMonth -= 1;
                            }
                        }
                    }
                }
                Text {
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter

                    text: Qt.formatDate(new Date(calendar.selectedYear, calendar.selectedMonth, 1), "MMMM yyyy")
                    font.family: Typography.fontFamily
                    font.pixelSize: Typography.fontSize
                    font.bold: true

                    color: Colors.fg
                }
                Rectangle {
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24

                    color: "transparent"
                    radius: Style.radius

                    Text {
                        anchors.centerIn: parent

                        text: "›"
                        font.family: Typography.fontFamily
                        font.pixelSize: Typography.fontSize * 2

                        color: Colors.accent2
                    }

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (calendar.selectedMonth === 0) {
                                calendar.selectedMonth = 11;
                                calendar.selectedYear -= 1;
                            } else {
                                calendar.selectedMonth -= 1;
                            }
                        }
                    }
                }
            }

            DayOfWeekRow {
                Layout.fillWidth: true

                locale: Qt.locale()

                delegate: Text {
                    required property string shortName
                    text: shortName
                    font.pixelSize: Typography.fontSize - 3
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter

                    color: Colors.fg
                    opacity: 0.5
                }
            }

            MonthGrid {
                Layout.fillWidth: true
                Layout.fillHeight: true

                month: calendar.selectedMonth
                year: calendar.selectedYear
                locale: Qt.locale()

                delegate: Rectangle {
                    required property var model

                    opacity: model.month === calendar.selectedMonth ? 1.0 : 0.25
                    color: model.today ? Colors.accent2 : "transparent"
                    radius: Style.radius

                    Text {
                        anchors.centerIn: parent

                        text: parent.model.day
                        font.family: Typography.fontFamily
                        font.pixelSize: Typography.fontSize - 1
                        font.bold: parent.model.today

                        color: model.today ? Colors.accent1 : Colors.fg
                    }
                }
            }
        }
    }
}