import QtQuick 2.2
import "components"

Page {

    Repeater {
        // land areas
        model: [
            [[55, 35], [70, 30], [65, 45], [57, 45]],
            [[0, 0], [0, 38], [22, 29], [32, 40], [45, 32], [35, 15], [47, 0]],
            [[56, 0], [85, 0], [95, 9], [85, 26], [70, 14], [60, 19], [56, 0]],
            [[0, 70], [30, 65], [38, 82], [55, 90], [42, 110], [60, parent.height], [0, parent.height]],
            [[parent.width, parent.height], [parent.width*2/3, parent.height], [parent.width*2/3-medium, parent.height-large], [parent.width*2/3 -medium, parent.height*3/4], [parent.width*3/4, parent.height*1/2], [parent.width*4/5, parent.height/3], [parent.width, parent.height/3 - medium]
            ]
        ]

        Polygon {
            property real value: 0.4+0.3*Math.random()
            color: Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, value))
            anchors.fill: parent
            array: modelData
        }
    }

    Line {
        // road
        anchors.fill: parent
        array: [[-small, parent.height*2/3+medium], [parent.width/3, parent.height*2/3], [parent.width/2+medium, parent.height*3/4], [parent.width*2/3+medium, parent.height*3/4 - extraSmall], [parent.width+small, parent.height*2/3 - medium]]
    }

    Repeater {
        // places of interests
        model: [[medium, medium-extraSmall], [large+small, parent.height*7/8], [parent.width*6/7, parent.height*2/5], [large-medium, parent.height*4/5]]

        Rectangle {
            x: modelData[0]
            y: modelData[1]
            height: width
            radius: width/2
            color: highlightColor
            width: medium-extraSmall
            Polygon {
                height: width
                width: parent.width
                color: highlightColor
                anchors {
                    top: parent.bottom
                    topMargin: -extraSmall
                    horizontalCenter: parent.horizontalCenter
                }
                array: [[0,0], [width, 0], [width/2, height]]
            }
        }
    }

    OptionsButton {
        anchors {
            margins: medium
            right: parent.right
            bottom: parent.bottom
        }
    }
}
