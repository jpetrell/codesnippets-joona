import QtQuick 2.6

Rectangle {
    property int sides
    property int radius: width/2
    property int lineWidth: unit

    color: "transparent"
    border.color: "transparent" // "white"
    border.width: 1

    Canvas {
        property color color: "white"
        rotation: Math.round(4*sides*Math.random())*(360/(sides*4))
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "white"
            ctx.lineWidth = lineWidth

            ctx.beginPath()
            var angle = 0
            var angleStep = 2*Math.PI/sides

            ctx.moveTo(width/2 + Math.cos(angle)*radius,
                       height/2 + Math.sin(angle)*radius)
            angle = angle + angleStep

            for (var i = 0; i <= sides; i++) {
                ctx.lineTo(width/2 + Math.cos(angle)*radius,
                           height/2 + Math.sin(angle)*radius)
                angle = angle + angleStep
            }
            ctx.stroke()
            ctx.restore()
        }
    }
}
