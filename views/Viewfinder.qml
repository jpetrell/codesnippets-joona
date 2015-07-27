import QtQuick 2.2
import "components"

Page {
    Item {
        // focus indicator
        width: huge
        height: huge
        anchors.centerIn: parent
        Repeater {
            anchors.fill: parent
            model: [
                [[lineWidth, height/3], [lineWidth, lineWidth], [width/3, lineWidth]],
                [[width*2/3, lineWidth], [width-lineWidth, lineWidth], [width-lineWidth, height/3]],
                [[lineWidth, height*2/3], [lineWidth, height-lineWidth], [width/3, height-lineWidth]],
                [[width*2/3, height-lineWidth], [width-lineWidth, height-lineWidth], [width-lineWidth, height*2/3]]

            ]

            Line {
                array: modelData
                anchors.fill: parent
            }
        }
    }

    Rectangle {
        // zoom indicator
        y: medium
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width/2
        height: extraSmall
        color: primaryColor

        Rectangle {
            // zoom level
            color: highlightColor
            x: parent.width*2/3
            anchors.verticalCenter: parent.verticalCenter
            height: small + extraSmall
            width: extraSmall
        }
        Rectangle {
            // zoom in icon
            height: extraSmall
            width: small + extraSmall
            color: primaryColor
            anchors {
                left: parent.right
                leftMargin: extraSmall
                verticalCenter: parent.verticalCenter
            }
            Rectangle {
                width: extraSmall
                height: small + extraSmall
                anchors.centerIn: parent
                color: primaryColor
            }
        }
        Rectangle {
            // zoom out icon
            height: extraSmall
            width: small + tiny
            color: primaryColor

            anchors {
                right: parent.left
                rightMargin: extraSmall
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Row {
        spacing: large
        anchors {
            bottomMargin: medium
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Button {
            anchors.bottom: parent.bottom
        }
        Button {
            anchors.bottom: parent.bottom
            Rectangle {
                anchors.centerIn: parent
                width: parent.width + small
                height: width
                color: "transparent"
                border { width: tiny; color: primaryColor }
                radius: width/2
            }
        }
        Rectangle {

            radius: width/2
            height: medium+extraSmall
            width: medium
            color: "transparent"
            anchors {
                bottom: parent.bottom
                bottomMargin: -tiny
            }
            border { width: tiny; color: primaryColor }
            Rectangle {
                width: small
                height: small
                radius: width/2
                color: primaryColor
                anchors {
                    bottom: parent.bottom
                    bottomMargin: lineWidth
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
