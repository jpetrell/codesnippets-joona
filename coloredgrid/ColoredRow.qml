import QtQuick 1.0

Row {
    width: 800; height: 400
    property real pixelsPerRelativeWidth
    function calculateColor() {
        var isRed = Math.random() < 0.2
        var grayness = 0.2+0.6*Math.random()
        var red = isRed ? grayness+0.6*Math.random()*(1-grayness) : grayness
        var green = isRed ? 0.5*grayness+0.5*Math.random()*grayness : 1.3*grayness
        var blue = isRed ? 0.7*grayness+0.3*Math.random()*grayness : 1.3*grayness
        return Qt.rgba(red, green, blue)
    }
    Component.onCompleted: {
        var totalRelativeWidth = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                totalRelativeWidth += children[index].relativeWidth
        }
        pixelsPerRelativeWidth = width/totalRelativeWidth
    }
    Repeater {
        id: repeater
        model: 50
        Rectangle {
            height: parent.height
            color: calculateColor()
            width: Math.ceil(relativeWidth*pixelsPerRelativeWidth)
            property real relativeWidth: Math.pow(Math.random(),3)
        }
    }
}
