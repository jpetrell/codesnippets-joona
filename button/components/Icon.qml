import QtQuick 2.2

Canvas {
    id: icon

    property bool highlighted
    property color color: highlighted ? secondaryColor : buttonColor
    property int numberOfPoints: 5
    onColorChanged: requestPaint()
    onPaint: {
        var numberOfPoints = 5
        var radius = width/2
        var ctx = getContext('2d')
        ctx.save();
        ctx.beginPath()
        ctx.fillStyle = icon.color
        ctx.clearRect(0, 0, width, height)
        ctx.translate(width/2, height/2)
        ctx.moveTo(0,0-radius);
        for (var i = 0; i < numberOfPoints; i++)
        {
            ctx.rotate(Math.PI / numberOfPoints)
            ctx.lineTo(0, 0 - (radius*0.45))
            ctx.rotate(Math.PI / numberOfPoints)
            ctx.lineTo(0, 0 - radius)
        }
        ctx.fill()
        ctx.restore()
    }
}
