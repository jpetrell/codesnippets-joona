import QtQuick 2.2
import "components"

Page {

    property real ratio: unit/2
    Repeater {
        // land areas
        model: [
            [[55*ratio, 35*ratio], [70*ratio, 30*ratio], [65*ratio, 45*ratio], [57*ratio, 45]*ratio],
            [[0, 0], [0, 38*ratio], [22*ratio, 29*ratio], [32*ratio, 40*ratio], [45*ratio, 32*ratio], [35*ratio, 15*ratio], [47*ratio, 0]],
            [[56*ratio, 0], [85*ratio, 0*ratio], [95*ratio, 9], [85*ratio, 26*ratio], [70*ratio, 14*ratio], [60*ratio, 19*ratio], [56*ratio, 0]],
            [[0, 70*ratio], [30*ratio, 65*ratio], [38*ratio, 82*ratio], [55*ratio, 90*ratio], [42*ratio, 110*ratio], [60*ratio, parent.height], [0, parent.height]],
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
