import QtQuick 2.2

Item {
    id: button

    width: 1.5*unit
    height: 1.5*unit
    property color color: backgroundColor

    Canvas {
        width: parent.width
        height: parent.height
        anchors {
            centerIn: parent
            verticalCenterOffset: unit/2
        }

        Rectangle {
            width: 2*unit
            height: 2*unit
            anchors {
                verticalCenter: parent.top
                horizontalCenter: parent.left
            }
            radius: width/2
            color: "transparent"
            border { width: unit/2; color: button.color }
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = button.color
            ctx.lineWidth = unit/2
            ctx.beginPath()
            ctx.moveTo(unit/2, unit/2)
            ctx.lineTo(width - 1, height - 1)
            ctx.stroke()
            ctx.restore()
        }
    }
}
