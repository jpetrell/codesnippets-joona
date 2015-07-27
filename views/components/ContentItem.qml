import QtQuick 2.2

Rectangle {
    property real value: 0.4+0.3*Math.random()

    width: huge
    height: huge
    color: Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 1-value))
}
