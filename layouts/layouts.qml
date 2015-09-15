import QtQuick 2.2
import "components"

Rectangle {

    property real tiny:  Math.round(extraSmall*2/3)
    property real extraSmall: Math.round(small*2/3)
    property real small: 7
    property real medium: 2*small
    property real large: 2*medium
    property real pageMargin: small + extraSmall
    property real fontSize: 18

    property color primaryColor: "#f8f1e0"
    property color pageColor: "#99dbcd"
    property color backgroundColor: "#f4ecda"
    property color titleColor: "#587280"
    property color contentColor: "#7295a6"

    width: grid.width + large + medium
    height: grid.y + grid.height + medium
    color: backgroundColor

    Grid {
        id: grid
        columns: 6

        rowSpacing: small
        columnSpacing: medium + tiny
        anchors.horizontalCenter: parent.horizontalCenter
        y: large

        // Top-to-bottom vertical list
        Page {
            clip: true
            ListView {
                spacing: small
                anchors {
                    fill: parent
                    margins: pageMargin
                    bottomMargin: 0
                }
                model: 20
                delegate: ContentItem {
                    text: model.index + 1
                    width: parent.width
                    height: medium + small
                }
            }
        }

        // Left-to-right horizontal list
        Page {
            clip: true
            ListView {
                anchors {
                    fill: parent
                    leftMargin: pageMargin
                    topMargin: pageMargin
                    bottomMargin: pageMargin
                }
                orientation: ListView.Horizontal
                model: 20
                spacing: small
                delegate: ContentItem {
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.index + 1
                    height: large*2
                    width: large - extraSmall
                }
            }

        }

        // Left-to-right and top-to-bottom grid
        Page {
            clip: true
            Grid {
                columns: 3
                spacing: small
                anchors {
                    fill: parent
                    margins: pageMargin
                }

                Repeater {
                    model: 11
                    ContentItem {
                        text: model.index + 1
                        width: (parent.width - parent.spacing*(parent.columns-1))/parent.columns
                        height: width + extraSmall
                    }
                }
            }
        }

        // Bottom-to-top vertical list
        Page {
            clip: true
            ListView {
                spacing: small
                verticalLayoutDirection: ListView.BottomToTop
                anchors {
                    fill: parent
                    margins: pageMargin
                }

                model: [medium + small, large+extraSmall,  medium+small, large, large+small+tiny]
                delegate: ContentItem {
                    property bool received: model.index % 2 == 1
                    width: parent.width - medium
                    x: received ? medium : 0
                    text: model.index + 1
                    height: modelData
                    radius: small/2
                    Canvas {
                        width:  medium
                        height: small + tiny
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
        }

        // Looping list
        Page {
            clip: true
            PathView {
                id: pathView
                anchors {
                    fill: parent
                    leftMargin: small
                    rightMargin: small
                }
                pathItemCount: 9
                model: 12
                preferredHighlightBegin: 0.5; preferredHighlightEnd: 0.5
                path: Path {
                    startY: -pathView.height/6; startX: pathView.width/2
                    PathAttribute { name: "iconScale"; value: 0.6 }
                    PathQuad {
                        x: pathView.width/2
                        y: pathView.height/2
                        controlY: 0
                        controlX: pathView.width/2
                    }
                    PathAttribute { name: "iconScale"; value: 1.0 }
                    PathQuad {
                        y: pathView.height * 7/6
                        x: pathView.width/2
                        controlY: pathView.height
                        controlX: pathView.width/2
                    }
                    PathAttribute { name: "iconScale"; value: 0.6 }
                }
                delegate: ContentItem {
                    width: PathView.iconScale*parent.width
                    height: PathView.iconScale*large
                    text: {
                        if (model.index == PathView.view.count - 1) {
                            return "N"
                        } else if (model.index < PathView.view.count/2) {
                            return model.index + 1
                        } else {
                            return "N - " + (PathView.view.count - model.index - 1)
                        }
                    }
                }
            }
        }

        // Particle layout
        Page {
            Repeater {
                model: [[parent.width/2 - extraSmall, parent.height/2],
                        [parent.width - large - small, large + small],
                        [large+extraSmall, parent.height - large - small],
                        [parent.width - large , parent.height - large - extraSmall],
                        [large, large],
                        [parent.width/2 + large + small, parent.height/2 - small]
                        ]
                ContentItem {
                    property real distance: Math.sqrt(Math.pow((parent.width/2-modelData[0])/(parent.width/2), 2), Math.pow((parent.height/2-modelData[1])/(parent.height/2), 2))

                    width: medium + (large + small) * (1-distance)
                    height: medium + tiny + (large + small) * (1-distance)
                    text: String.fromCharCode(65 + model.index)
                    x: modelData[0] - width/2
                    y: modelData[1] - height/2
                }
            }
        }

        // Titles
        Repeater {
            model: ["Vertical", "Horizontal", "Grid", "Inverted", "Looping", "Cloud"]
            Text {
                width: 8*medium
                color: titleColor
                text: modelData
                font.pixelSize: fontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
