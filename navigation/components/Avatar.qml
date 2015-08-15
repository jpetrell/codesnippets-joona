import QtQuick 2.2

Rectangle {
    clip: true
    color: highlightColor

    Rectangle {
        id: head
        y: height/3
        anchors.horizontalCenter: parent.horizontalCenter
        color: contentColor
        radius: width/4
        height: parent.width/2
        width: parent.width*3/10
    }

    Rectangle {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: head.bottom
            topMargin: -head.radius - tiny
            bottom: parent.bottom
            bottomMargin: -radius
        }
        width: parent.width * 2/3
        radius: head.radius
        color: contentColor
    }
}
