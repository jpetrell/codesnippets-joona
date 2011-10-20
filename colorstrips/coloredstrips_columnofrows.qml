import QtQuick 1.0

Column {
    width: 800; height: 400
    property real pixelsPerRelativeHeight
    Component.onCompleted: {
        var totalRelativeHeight = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                totalRelativeHeight += children[index].relativeHeight
        }
        pixelsPerRelativeHeight = height/totalRelativeHeight
    }
    Repeater {
        id: repeater
        model: 40
        ColoredRow {
            width: parent.width
            height: Math.ceil(relativeHeight*pixelsPerRelativeHeight)
            property real relativeHeight: Math.pow(Math.random(),3)
            function rectangleColor() {
                var isBlue = Math.random() < 0.2
                var grayness = 0.2+0.6*Math.random()
                var red = isBlue ? 0.5*grayness+0.5*Math.random()*grayness : grayness
                var green = isBlue ? grayness+0.6*Math.random()*(1-grayness) : 1.3*grayness
                var blue = isBlue ? 0.7*grayness+0.3*Math.random()*grayness : 1.3*grayness
                return Qt.rgba(red, green, blue)
            }
        }
    }
}
