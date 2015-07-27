import QtQuick 2.2
import "components"

Page {

    ContentItem {
        id: clippedItem
        x: medium
        height: large + small
        width: parent.width - x
    }

    ContentItem {
        id: secondClippedItem

        width: parent.width/2
        height: rightColumn.height
        anchors {
            top: clippedItem.bottom
            topMargin: medium
        }
    }

    Column {
        id: rightColumn

        clip: true
        spacing: medium
        anchors {
            top: secondClippedItem.top
            left: secondClippedItem.right
            leftMargin: medium
            right: parent.right
        }

        ContentItem {
            height: secondClippedItem.height/2
            width: parent.width
        }
        Column {
            spacing: small
            width: parent.width + small
            Repeater {
                model: 3
                Label {}
            }
        }
    }


    Panel {
        id: panel
        anchors.bottom: parent.bottom

        Label {
            anchors {
                left: parent.left
                right: buttons.left
                margins: medium
                verticalCenter: parent.verticalCenter
            }
        }
        Row {
            id: buttons
            spacing: small
            anchors {
                right: parent.right
                rightMargin: medium
                verticalCenter: parent.verticalCenter
            }

            Button {}
            Button {}
        }
    }
}
