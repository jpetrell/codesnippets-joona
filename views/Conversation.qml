import QtQuick 2.2
import "components"

Page {
    clip: true

    Column {
        x: medium
        width: parent.width - 2*x
        y: -medium
        spacing: small

        Repeater {
            model: [medium + small, large, medium, small + extraSmall, medium+extraSmall, small + extraSmall]

            Rectangle {
                property bool received: model.index % 2 == 1
                width: parent.width - medium
                x: received ? medium : 0
                color: received ? highlightColor : Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 0.4))
                height: modelData
                radius: small/2
                Canvas {
                    width: medium
                    height: small + extraSmall
                    anchors {
                        top: parent.bottom
                        topMargin: -extraSmall
                        right: received ? parent.right : undefined
                    }
                    Component.onCompleted: requestPaint()
                    onPaint: {
                        var ctx = getContext('2d')
                        ctx.save()
                        ctx.clearRect(0, 0, width, height)
                        ctx.fillStyle = parent.color
                        ctx.beginPath()
                        if (parent.received) {
                            ctx.lineTo(width, 0)
                            ctx.lineTo(width, height)
                        } else {
                            ctx.lineTo(0,height)
                            ctx.lineTo(width, 0)
                        }
                        ctx.lineTo(0, 0)
                        ctx.closePath()
                        ctx.fill()
                        ctx.restore()
                    }
                }
            }
        }

        Item { width: 1; height: 1 }

        Row {
            spacing: small
            width: parent.width
            TextField {
                height: medium
                width: parent.width - button.width - parent.spacing
            }
            Button {
                id: button
                anchors.bottom: parent.bottom
            }
        }
    }

}
