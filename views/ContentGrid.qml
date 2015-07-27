import QtQuick 2.2
import "components"

Page {

    Grid {
        width: parent.width
        columns: 4
        Repeater {
            model: 20
            ContentItem {
                value: 0.2+0.5*Math.random()
                width: parent.width/parent.columns
                height: width
            }
        }
    }

    Panel {
        anchors.bottom: parent.bottom
        Row {
            spacing: large
            anchors.centerIn: parent
            Repeater {
                model: 3
                Button {}
            }
        }
    }
}
