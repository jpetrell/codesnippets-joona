import QtQuick 2.2
import "components"

Page {

    Item {
        width: parent.width
        height: parent.height - panel.height

        Row {
            anchors.centerIn: parent
            spacing: small
            Repeater {
                model: 5
                Rectangle {
                    color: primaryColor
                    width: small
                    height: small
                    radius: width/2
                }
            }
        }
    }

    Panel {
        id: panel
        height: grid.height + medium
        anchors.bottom: parent.bottom

        Grid {
            id: grid
            columns: 3
            spacing: small
            anchors.centerIn: parent
            Repeater {
                model: 9

                Text {
                    text: model.index+1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    height: large
                    width: medium+small
                    font.pixelSize: fontSizeMedium
                    color: primaryColor
                }
            }
        }
    }
}
