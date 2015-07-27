import QtQuick 2.0

Column {
    spacing: tiny
    width: medium
    property color color: primaryColor
    Repeater {
        model: 3

        Rectangle {
            height: tiny
            color: parent.color
            width: parent.width
            radius: height/2
        }
    }
}
