import QtQuick 1.0

Rectangle {
    width: 200; height: 200
    scale: PathView.iconScale
    z: PathView.view.zLevel(index)
    color: Qt.rgba(0.5+(PathView.view.count - number)*Math.random()/PathView.view.count,
                   0.3+number*Math.random()/PathView.view.count, 0.3*Math.random(), 0.7)
    signal clicked
    Keys.onReturnPressed: clicked()
    onClicked: PathView.view.currentIndex = index
    MouseArea {
        id: delegateMouse
        anchors.fill: parent
        onClicked: parent.clicked()
    }
    Rectangle {
        color: Qt.rgba(0.2, 0.3, 0.8)
        opacity: delegateMouse.pressed ? 0.8 : 0.0
        anchors.fill: parent
    }
    Text {
        smooth: true
        color: "white"
        font.pixelSize: 30
        text: "ITEM\n" + item
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }
}
