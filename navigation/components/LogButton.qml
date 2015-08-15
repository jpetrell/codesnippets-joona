import QtQuick 2.0

Column {
    id: button
    property color color: highlightColor
    spacing: lineWidth+tiny
    width: medium

    Repeater {
        model: 2

        // Arrow body
        Rectangle {
            property bool invert: model.index === 0
            height: tiny
            width: parent.width
            color: button.color

            // Arrow head
            Line {
                anchors {
                    left: invert ? parent.left : undefined
                    right: invert ? undefined : parent.right
                    verticalCenter: parent.verticalCenter
                    margins: -tiny
                }
                lineWidth: tiny
                height: buttonWidth+extraSmall
                width: small+tiny
                color: button.color
                array: invert ? [[width-tiny, tiny], [tiny, height/2], [width-tiny, height-tiny]]
                              : [[tiny, tiny], [width-tiny, height/2], [tiny, height-tiny]]

            }
        }
    }
}
