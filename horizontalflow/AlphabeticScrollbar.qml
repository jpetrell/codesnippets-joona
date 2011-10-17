import QtQuick 1.0

MouseArea {
    width: 400; height: 50
    property variant view
    property variant alphabets
    property variant alphabetIndeces
    property real letterWidth: (width + 10)/alphabets.length
    Rectangle {
        radius: 10
        color: "white"
        visible: scrollbarMouse.pressed
        height: letterWidth+60; width: letterWidth+30
        x: Math.min(Math.max(0,scrollbarMouse.mouseX-width/2), parent.width-width)
        anchors { bottom: parent.bottom; bottomMargin: -10 }
        Text {
            font.pixelSize: 30
            text: alphabets[scrollbarMouse.currentIndex]
            anchors { centerIn: parent; verticalCenterOffset: -20 }
        }
    }
    Rectangle {
        height: 20
        color: Qt.rgba(1.0, 1.0, 1.0, 0.2)
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
    }
    MouseArea {
        id: scrollbarMouse
        anchors.fill: parent
        property int currentIndex: 0
        function updatePosition(x) {
            var index = Math.round((x-10)/letterWidth);
            if (index >= 0 && index < alphabetIndeces.length) {
                currentIndex = index;
                view.currentIndex = alphabetIndeces[index];
            }
        }
        onPressed: updatePosition(mouse.x)
        onPositionChanged: updatePosition(mouse.x)
    }
}
