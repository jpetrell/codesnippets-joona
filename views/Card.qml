import QtQuick 2.2
import "components"

Page {

    Column {
        width: parent.width
        spacing: medium

        Panel {
            Button {
                x: medium
                anchors.verticalCenter: parent.verticalCenter
            }
            OptionsButton {
                anchors {
                    right: parent.right
                    rightMargin: medium
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        Row {
            x: medium
            width: parent.width - 2*x
            spacing: medium
            Column {
                id: column
                spacing: medium
                width: 1/2 * parent.width
                Label {}
                Label {}
                Label {}
            }
            ContentItem {
                id: avatar
                color: highlightColor
                width: 1/2 * parent.width - medium
                height: column.height
            }
        }

        Label {
            width: parent.width/2
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            x: medium
            width: parent.width - 2*x
        }
        Label {
            width: parent.width/2
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            x: medium
            width: parent.width - 2*x
        }
    }
}
