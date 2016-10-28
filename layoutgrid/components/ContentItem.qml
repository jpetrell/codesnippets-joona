import QtQuick 2.2

Rectangle {
    id: root
    color: contentColor

    border {
        width: wireframe ? lineWidth : 0
        color: Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.4)
    }
    Binding {
        target: root
        when: wireframe
        property: "color"
        value: "transparent"
    }
}
