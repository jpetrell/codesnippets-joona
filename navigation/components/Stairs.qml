import QtQuick 2.0

Row {
    Rectangle {
        height: parent.height
        width: tiny
    }
    Column {
        spacing: extraSmall
        Repeater {
            model: (parent.parent.height + parent.spacing)/(tiny+parent.spacing)
            Rectangle {
                width: small
                height: tiny
            }
        }
    }
    Rectangle {
        height: parent.height
        width: tiny
    }
}
