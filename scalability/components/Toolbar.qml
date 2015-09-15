import QtQuick 2.0

Panel {
    id: toolbar
    property int count: 3
    anchors.bottom: parent.bottom
    Row {
        spacing: large
        anchors.centerIn: parent
        Repeater {
            model: toolbar.count
            Button {}
        }
    }
}

