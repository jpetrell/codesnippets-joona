import QtQuick 2.2
import "components"

Page {

    Column {
        x: medium
        y: medium
        spacing: medium
        width: parent.width - 2*x

        Row {
            spacing: small
            width: parent.width

            Column {
                id: column
                spacing: small
                width: parent.width - parent.spacing - icon.width
                Label {}
                Label {}
            }
            ContentItem {
                id: icon
                color: highlightColor
                width:  medium
                height: column.height
            }
        }

        Column {
            spacing: small
            width: parent.width
            Repeater {
                model: 2
                Row {
                    spacing: extraSmall
                    width: parent.width
                    Button {
                        id: button
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Label {
                        width: parent.width - parent.spacing - button.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Column {
            spacing: small
            width: parent.width
            Label { width: parent.width/2 }
            Label {}
            TextField {}
        }

        Column {
            spacing: small
            width: parent.width
            Label { width: parent.width/2 }
            TextField {}
        }
    }
}
