import QtQuick 2.6

Rectangle {
    clip: true
    color: "transparent"
    border.color: "transparent" // "white"
    border.width: 1
    Canvas {
        property color color: "white"
        anchors.fill: parent

        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "white"
            ctx.lineWidth = unit

            var count = Math.round(3 + 3 * Math.random())

            var angle = 0
            var granularity = Math.PI/12
            ctx.beginPath()
            while (angle < 2*Math.PI) {
                angle = granularity*Math.round((angle + 2*Math.PI/count*(0.5 + Math.random())) / granularity)
                if (angle > 2*Math.PI) continue
                ctx.moveTo(round(width/2), round(height/2))
                ctx.lineTo(round(width/2 + Math.cos(angle)*width/2*(1.3 + 0.4*Math.random())),
                           round(height/2 + Math.sin(angle)*height/2*(1.3 + 0.4*Math.random())))
            }
            ctx.stroke()
            ctx.restore()
        }
    }
}
