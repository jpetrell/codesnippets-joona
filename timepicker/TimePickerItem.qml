import QtQuick 1.0

Rectangle {
    id: timePickerItem
    property int number
    property bool pressed: itemMouse.pressed || highlightTimer.running
    property bool isCurrentItem: ListView.isCurrentItem
    color: index % 2 ? "white" : "lightgray"
    height: 60; width: parent.width
    Rectangle {
        color: "black"
        opacity: parent.pressed ? 0.3 : 0.0
        anchors { fill: parent; margins: -1 }
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }
    }
    MouseArea {
        id: itemMouse
        anchors.fill: parent
        enabled: !ListView.isCurrentItem
        onClicked: ListView.view.currentIndex = index
    }
    Text {
        text: number >= 0 ? number : ""
        font.pixelSize: 26
        anchors.centerIn: parent
    }
    Timer {
        id: highlightTimer
        interval: 200
        running: parent.pressed
    }
}
