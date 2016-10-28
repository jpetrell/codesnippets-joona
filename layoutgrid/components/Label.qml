import QtQuick 2.2

Item {
    property alias color: rectangle.color
    width: parent.width
    height: unit/2
    Rectangle {
        id: rectangle
        color: primaryColor
        anchors.verticalCenter: parent.verticalCenter
        height: wireframe ? lineWidth : parent.height
        width: parent.width
        radius: wireframe ? 0 : height/2
    }
}

