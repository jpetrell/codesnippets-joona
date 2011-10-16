import QtQuick 1.0

Rectangle {
    property string text
    radius: 4.0
    color: "black"
    width: 107; height: 70
    scale: buttonMouse.pressed ? 0.95 : 1.0
    Behavior on scale {
        NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
    }
    signal clicked
    Text {
        color: "white"
        text: parent.text
        font.pixelSize: 28
        elide: Text.ElideRight
        smooth: buttonMouse.pressed
        anchors.centerIn: parent
    }
    MouseArea {
        id: buttonMouse
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
