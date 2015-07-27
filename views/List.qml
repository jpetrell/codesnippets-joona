import QtQuick 2.2
import "components"

Page {

    Column {
        y: small
        width: parent.width
        Repeater {
            model: 6

            Item {
                width: parent.width
                height: large
                Row {
                    id: row
                    x: medium
                    spacing: small
                    width: parent.width - 2*x
                    anchors.verticalCenter: parent.verticalCenter

                    ContentItem {
                        id: contentItem
                        anchors.verticalCenter: parent.verticalCenter
                        height: column.height
                        width: column.height
                    }
                    Column {
                        id: column
                        spacing: extraSmall
                        width: parent.width - parent.spacing - contentItem.width
                        anchors.verticalCenter: parent.verticalCenter
                        Label {}
                        Label {}
                    }
                }
            }
        }
    }
}
