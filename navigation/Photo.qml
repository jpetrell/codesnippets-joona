import QtQuick 2.0
import "components"

Page {
    clip: true

    // Clouds
    Rectangle {
        x: parent.width/2
        anchors.verticalCenter: parent.top
        width: 2*large
        height: 2*large
        radius: width/2
        color: primaryColor
    }
    Rectangle {
        anchors {
            horizontalCenter: parent.right
            verticalCenter: parent.top
        }
        width: 3*large
        height: 3*large
        radius: width/2
        color: primaryColor
    }

    // Sun
    Rectangle {
        x: medium
        y: medium
        width: large
        height: large
        radius: width/2
        color: Qt.rgba(0.95,0.95,0.4,1)
    }

    // Birds
    Repeater {
        model: [[2*large, large], [parent.width/2, large + medium], [medium, parent.height/3]]

        Canvas {
            property real radius: small/2
            property real lineWidth: radius/2
            x: modelData[0]
            y: modelData[1]
            width: 4*radius
            height: radius+lineWidth
            onPaint: {
                var ctx = getContext('2d')
                ctx.save()
                ctx.clearRect(0, 0, width, height)
                ctx.strokeStyle = primaryColor
                ctx.lineWidth = lineWidth
                ctx.beginPath()
                ctx.moveTo(width/2, height)
                ctx.arc(radius,height,radius,0, Math.PI*6/5, true);
                ctx.moveTo(width/2, height)
                ctx.arc(3*radius,height,radius,Math.PI, Math.PI*9/5);
                ctx.stroke()
                ctx.restore()
            }
        }
    }

    // Mountains
    Polygon {
        id: firstMountain

        x: parent.width/4
        color: contentColor
        width: parent.width/3
        height: parent.width/5 - small
        array: [[0, height], [width/2, 0], [width, height]]
        anchors.bottom: land.top
    }
    Polygon {
        color: contentColor
        width: parent.width/2
        height: parent.width/4
        array: [[0, height], [width/2, 0], [width, height]]
        x: parent.width/4
        anchors {
            left: firstMountain.right
            bottom: land.top
        }
    }

    // Land
    Rectangle {
        id: land

        color: Qt.tint(contentColor, Qt.rgba(1,1,1,0.3))
        width: parent.width
        height: parent.height*2/5
        anchors.bottom: parent.bottom

        // Road
        Line {
            color: contentColor
            anchors.fill: parent
            array: [[0, height*9/10], [width/2, height*7/10], [width/2-medium, height*5/10], [width, height*2/10]]
        }
    }
}
