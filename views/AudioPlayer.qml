import QtQuick 2.0
import "components"

Page {

    Column {
        width: parent.width
        height: parent.height

        ContentItem {
            // album art
            value: 0.1+0.1*Math.random()
            width: parent.width
            height: parent.height - panel.height

            Repeater {
                model: [
                    [[0,0], [medium, 0], [large, large], [0, huge]],
                    [[parent.width/3, 0], [parent.width, 0], [parent.width, small], [parent.width - medium, huge], [parent.width - huge, medium], [parent.width/2, large]],
                    [[0, parent.height/2], [parent.width/4, parent.height/3 + medium + small], [parent.width/2, parent.height/2 - medium], [parent.width*3/4 - small, parent.height/3 + large], [parent.width-large, parent.height/2 - small], [parent.width, parent.height/2], [parent.width, parent.height*5/6], [parent.width - medium, parent.height*3/4], [parent.width*2/3, parent.height*2/3+medium], [parent.width/3, parent.height/2+small], [0,parent.height*3/4]]
                ]
                Polygon {
                    property real value: 0.4+0.3*Math.random()
                    color: Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, value))
                    anchors.fill: parent
                    array: modelData
                }
            }

            Row {
                // song info
                x: medium
                anchors {
                    bottom: parent.bottom
                    bottomMargin: small
                }
                width: parent.width - 2*x
                Column {
                    spacing: small
                    width: parent.width/2
                    Label {}
                    Label {}
                }
                Item {
                    height: 1
                    width: parent.width/2 - buttonWidth
                }
                Button {
                    anchors.bottom: parent.bottom
                }
            }
        }

        Panel {
            id: panel
            width: parent.width
            height: column.height + column.y + medium

            Column {
                id: column
                y: small
                spacing: extraSmall
                x: medium
                width: parent.width - 2*x
                Text {
                    text: "0:31"
                    color: primaryColor
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: fontSizeSmall
                }
                Rectangle {
                    color: primaryColor
                    width: parent.width
                    height: extraSmall
                }
                Item { width: 1; height: 1 }
                Row {
                    spacing: large
                    anchors.horizontalCenter: parent.horizontalCenter
                    Button {}
                    Polygon {
                        color: primaryColor
                        width: buttonWidth
                        height: buttonWidth
                        array: [[0,0], [width, height/2], [0, height]]
                    }
                    Button {}
                }
            }
        }
    }
}
