import QtQuick 2.0

Item {
    id: arrow

    property color color: primaryColor

    width: large
    height: large

    Rectangle {
        width: line.lineWidth
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height
        color: arrow.color

        // Arrow head
        Line {
            id: line

            anchors {
                bottom: parent.bottom
                bottomMargin: -lineWidth
                horizontalCenter: parent.horizontalCenter
            }

            width: large
            height: medium+extraSmall
            array: [[lineWidth, lineWidth], [width/2, height-lineWidth], [width-lineWidth, lineWidth]]
            color: arrow.color
        }
    }
}
