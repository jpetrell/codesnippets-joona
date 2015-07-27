import QtQuick 2.2
import "components"

Page {
    clip: true

    Column {
        y: medium
        x: medium
        width: parent.width - 2*x
        spacing: small

        Row {
            width: parent.width
            spacing: small

            Grid {
                id: grid
                width: parent.width*2/3 - parent.spacing
                columns: 3
                Repeater {
                    model: 9

                    ContentItem {
                        value: 0.3+0.6*Math.random()
                        width: parent.width/parent.columns
                        height: width
                    }
                }
            }
            ContentItem {
                height: grid.height
                width: parent.width/3
            }
        }

        Column {
            width: parent.width
            spacing: small

            ContentItem {
                height: medium
                width: parent.width
                Button {
                    width: small
                    height: small
                    x: extraSmall
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            ContentItem {
                height: medium
                width: parent.width
                Button {
                    width: small
                    height: small
                    x: extraSmall
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Row {
            property int count: 5
            width: parent.width
            spacing: (width - count*buttonWidth) / (count-1)
            Repeater {
                model: parent.count
                Button { color: highlightColor }
            }
        }

        Row {
            property int count: 3
            width: parent.width
            spacing: small
            Repeater {
                model: parent.count
                ContentItem {
                    width: (parent.width - parent.count*parent.spacing + parent.spacing)/parent.count
                }
            }
        }
    }
}
