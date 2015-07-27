import QtQuick 2.2

Item {
    width: buttonWidth
    height: buttonWidth

    Canvas {
        width: parent.width
        height: parent.height
        anchors {
            centerIn: parent
            verticalCenterOffset: extraSmall/2
            horizontalCenterOffset: extraSmall/2
        }

        Rectangle {
            width: small+extraSmall
            height: small+extraSmall
            anchors {
                verticalCenter: parent.top
                horizontalCenter: parent.left
            }
            radius: width/2
            color: "transparent"
            border { width: tiny; color: primaryColor }
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = primaryColor
            ctx.lineWidth = 3 // extraSmall
            ctx.beginPath()
            ctx.moveTo(2, 2)
            ctx.lineTo(width - 1, height - 1)
            ctx.stroke()
            ctx.restore()
        }
    }
}
