import QtQuick 2.2
import "components"

Page {

    Panel {
        Label {
            x: medium
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/4
        }
        OptionsButton {
            id: button
            color: highlightColor
            anchors {
                right: parent.right
                rightMargin: medium
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Bubble {
        id: firstBubble

        y: parent.height/4 - tiny
        x: medium+small
        width: parent.width*2/3
        lineCount: 3

        BezierLine {
            width: large-extraSmall
            height: large
            x: parent.width/2 - lineWidth + small
            anchors.bottom: parent.top
            contextPoint: [lineWidth, height]
            firstControlPoint: [lineWidth, height/2]
            secondControlPoint: [width/2, height/5]
            endPoint: [width, lineWidth]

            Line {
                // arrow head
                rotation: 25
                transformOrigin: Item.TopRight
                anchors.right: parent.right
                anchors.rightMargin: -small
                width: medium+extraSmall
                height: medium+extraSmall
                array: [[lineWidth, lineWidth], [width-lineWidth, lineWidth], [width-lineWidth, height-lineWidth]]
                y: 1
            }
        }
    }
    Bubble {
        anchors {
            top: firstBubble.bottom
            right: parent.right
            topMargin: medium
            rightMargin: medium+tiny
        }
        width: parent.width/2
        lineCount: 2

        BezierLine {
            width: large-small
            height: large
            anchors {
                top: parent.verticalCenter
                topMargin: -lineWidth
                right: parent.left
            }
            contextPoint: [width, lineWidth]
            firstControlPoint: [width/2, lineWidth]
            secondControlPoint: [lineWidth, height/2]
            endPoint: [lineWidth, height]

            Line {
                // arrow head
                x: 1
                rotation: -30
                width: medium+extraSmall
                height: medium+extraSmall
                transformOrigin: Item.BottomLeft
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -small
                array: [[lineWidth,lineWidth], [lineWidth, width-lineWidth], [width-lineWidth, height-lineWidth]]
            }
        }
    }

    Row {
        spacing: large
        anchors {
            bottom: parent.bottom
            bottomMargin: medium
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: 3

            Button {
                color: model.index === 0 ? highlightColor : primaryColor
            }
        }
    }
}
