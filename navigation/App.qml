import QtQuick 2.0
import "components"

Page {
    clip: true

    // Platforms
    Platform {
        width: parent.width/3
        y: parent.height/2 - medium
        Door {
            x: parent.width/2 - width
        }
    }
    Platform {
        id: topPlatform

        width: parent.width/2+small
        y: parent.height/3 - 2*medium
        x: parent.width/4 + extraSmall
        Door {
            x: parent.width/3
        }
    }
    Platform {
        id: rightPlatform

        width: parent.width/2 - medium
        y: parent.height*2/3 - 2*medium
        anchors.right: parent.right
        Door {
            x: large
        }
    }

    Stairs {
        anchors {
            top: topPlatform.top
            left: rightPlatform.left
            leftMargin: small
            bottom: rightPlatform.top
        }
    }

    // Land
    Land {
        x: -medium
        width: large+medium
        height: parent.height/3 + medium
    }
    Land {
        width: medium+small
        height: parent.height/3 + medium
        anchors {
            right: parent.right
            rightMargin: small
        }
    }
    Land {
        width: large
        height: parent.height/3 + large
        anchors.horizontalCenter: parent.right
    }

    // Water
    Canvas {
        property var array
        property color color: Qt.tint(backgroundColor, Qt.rgba(1,1,1,0.1))
        height: parent.height/6
        width: parent.width
        anchors.bottom: parent.bottom
        opacity: 0.6
        onPaint: {
            var radius = width/16
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0, 0, width, height)
            ctx.fillStyle = color
            ctx.beginPath()

            for (var i = 0; i < width/radius; i++) {
                ctx.arc(radius + 2*i*radius - radius,0,radius,Math.PI,0, true);
            }
            ctx.lineTo(width, height)
            ctx.lineTo(0, height)
            ctx.closePath()
            ctx.fill()
            ctx.restore()
        }
    }
}
