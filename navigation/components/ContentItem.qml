import QtQuick 2.2

Rectangle {
    property real value: 0.2+0.5*Math.random()
    property color implicitColor: Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 1-value))

    width: huge
    height: huge
    color: implicitColor
}
