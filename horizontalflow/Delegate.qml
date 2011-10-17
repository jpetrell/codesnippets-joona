import QtQuick 1.0

Rectangle {
    opacity: 0.7
    width: 200; height: 200
    scale: PathView.iconScale
    z: PathView.view.zLevel(index)
    color: Qt.rgba(0.5+(PathView.view.count - number)*Math.random()/PathView.view.count,
                   0.3+number*Math.random()/PathView.view.count, 0.3*Math.random(), 1.0)
    Keys.onReturnPressed: clicked()
    signal clicked
    onClicked: PathView.view.currentIndex = index
    Text {
        smooth: true
        color: "white"
        font.pixelSize: 30
        text: "ITEM\n" + item
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
