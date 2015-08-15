import QtQuick 2.2
import "components"

Page {

    clip: true
    Grid {
        width: parent.width
        columns: 4
        Repeater {
            model: 24
            ContentItem {
                value: 0.2+0.5*Math.random()
                width: parent.width/parent.columns
                height: width
                color: model.index === 5 ? highlightColor : implicitColor
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
