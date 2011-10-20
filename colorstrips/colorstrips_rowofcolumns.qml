import QtQuick 1.0

Row {
    width: 800; height: 400
    property real pixelPerRelativeWidth
    Component.onCompleted: {
        var totalRelativeWidth = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                totalRelativeWidth += children[index].relativeWidth
        }
        pixelPerRelativeWidth = width/totalRelativeWidth
    }
    Repeater {
        id: repeater
        model: 50
        ColorColumn {
            height: parent.height
            width: Math.ceil(relativeWidth*pixelPerRelativeWidth)
            property real relativeWidth: Math.pow(Math.random(),3)
            function rectangleColor() {
                var value = Math.random()
                var blue = value < 0.4 ? 0.8+0.2*Math.random() : 0.1+0.4*Math.random()
                var red = value > 0.4 && value < 0.8 ? 0.7+0.3*Math.random() : 0.4+0.3*Math.random()
                var green = value > 0.8 ? 0.2+0.2*Math.random() : 0.2*Math.random()
                return Qt.rgba(red, green, blue)
            }
        }
    }
}
