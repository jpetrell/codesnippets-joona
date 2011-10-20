import QtQuick 1.0

Column {
    width: 800; height: 400
    property real pixelsPerRelativeHeight
    function calculateColor() {
        var value = Math.random()
        var red = value < 0.4 ? 0.8+0.2*Math.random() : 0.1+0.4*Math.random()
        var green = value > 0.4 && value < 0.8 ? 0.7+0.3*Math.random() : 0.4+0.3*Math.random()
        var blue = value > 0.8 ? 0.6+0.2*Math.random() : 0.2*Math.random()
        return Qt.rgba(red, green, blue)
    }
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
        Rectangle {
            width: parent.width
            color: calculateColor()
            height: Math.ceil(relativeHeight*pixelsPerRelativeHeight)
            property real value: Math.random()
            property real relativeHeight: Math.pow(Math.random(),3)
        }
    }
}
