import QtQuick 2.2

Canvas {
    property var contextPoint
    property var firstControlPoint
    property var secondControlPoint
    property var endPoint

    onPaint: {
        var ctx = getContext('2d')
        ctx.save()
        ctx.clearRect(0, 0, width, height)
        ctx.strokeStyle = primaryColor
        ctx.lineWidth = lineWidth
        ctx.beginPath()
        ctx.moveTo(contextPoint[0], contextPoint[1])
        ctx.bezierCurveTo(firstControlPoint[0], firstControlPoint[1],
                          secondControlPoint[0], secondControlPoint[1],
                          endPoint[0], endPoint[1])
        ctx.stroke()
        ctx.restore()
    }
}
