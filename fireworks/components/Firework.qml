import QtQuick 2.6

Rectangle {
    color: "transparent"
    border.color: "transparent" // "white"
    border.width: 1
    RotationAnimator on rotation {
        from: 0
        to: (Math.random() > 0.5 ? -1 : 1) * 360
        loops: Animation.Infinite
        running: Qt.application.active
        duration: 5000 + Math.random() * 4000
    }

    Canvas {
        property color color: "white"
        anchors.fill: parent
        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "white"
            ctx.lineWidth = unit

            var count = Math.round(4 + 4 * Math.random())

            var angle = 0
            var granularity = Math.PI/12
            ctx.beginPath()
            while (angle < 2*Math.PI) {
                ctx.strokeStyle = Qt.rgba(0.6 + 0.4*Math.random(), 0.6 + 0.4*Math.random(), 0.6, 1)
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
