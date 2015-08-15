import QtQuick 2.2
import "components"

Page {
    id: page
    clip: true

    Panel {
        height: row.height

        Row {
            id: row
            x: extraSmall
            width: parent.width - 2*x
            spacing: extraSmall
            height: extraSmall+2*tiny
            Repeater {
                model: 2
                Rectangle {
                    y: tiny
                    height: extraSmall
                    width: height
                    color: primaryColor
                }
            }
            Item {
                height: parent.height
                width: parent.width - 10*extraSmall
            }

            Repeater {
                model: 3
                Rectangle {
                    y: tiny
                    height: extraSmall
                    width: height
                    color: primaryColor
                }
            }
        }


    }

    Row {
        property int count: 3
        anchors.horizontalCenter: parent.horizontalCenter
        y: medium+small+tiny

        Repeater {
            model: parent.count

            Item {
                property bool currentItem: model.index === 1
                width: page.width*2/3
                height: page.height*2/3
                scale: currentItem ? 1 : 0.8

                ContentItem {
                    width: parent.width
                    height: parent.height
                    color: currentItem ? highlightColor : implicitColor

                    Panel {
                        height: medium
                    }
                }
            }
        }
    }

    // Row layout
    Row {
        property int count: 5
        width: parent.width - 2*small
        spacing: (width - count * medium)/(count-1)
        anchors {
            bottom: parent.bottom
            bottomMargin: small
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: parent.count

            Rectangle {
                color: primaryColor
                width: medium
                height: medium
                radius: width/4
            }
        }
    }
}
