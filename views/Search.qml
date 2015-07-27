import QtQuick 2.0
import "components"

Page {

    Column {
        y: medium
        width: parent.width
        spacing: medium

        Row {
            x: medium
            spacing: small
            width: parent.width - 2*x

            SearchButton {
                id: button
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                width: parent.width - button.width - parent.spacing
            }
        }

        Column {
            x: medium
            spacing: small
            width: parent.width - 2*x
            Repeater {
                model: 4
                Label {}
            }
        }
    }

    Keyboard {}
}
