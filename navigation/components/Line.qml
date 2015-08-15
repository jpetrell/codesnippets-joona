import QtQuick 2.2

Canvas {
    property var array
    property color color: "white"
    property real lineWidth: navigation.lineWidth

    onPaint: {
        var ctx = getContext('2d')
        ctx.save()
        ctx.clearRect(0, 0, width, height)
        ctx.strokeStyle = color
        ctx.lineWidth = lineWidth
        ctx.beginPath()
        ctx.moveTo(array[0][0], array[0][1])
        for (var i = 1; i < array.length; i++) {
            ctx.lineTo(array[i][0], array[i][1])
        }
        ctx.stroke()
        ctx.restore()
    }
}
