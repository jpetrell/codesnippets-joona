import QtQuick 2.2

Item {
    z: 1000
    anchors.fill: parent

    Row {
        x: pageMargin - lineWidth/2
        height: parent.height
        spacing: 5*unit - lineWidth
        Repeater {
            model: 5
            Rectangle {
                opacity: 0.4
                width: lineWidth
                height: parent.height
                color: layoutGridColor
            }
        }
    }
    Repeater {
        model: [2, 3, 6, 7, 12, 13, 17, 18, 23, 24, 28, 29, 31]
        Rectangle {
            y: modelData*unit - lineWidth/2
            opacity: 0.4
            height: lineWidth
            width: parent.width
            color: layoutGridColor
        }
    }
}
