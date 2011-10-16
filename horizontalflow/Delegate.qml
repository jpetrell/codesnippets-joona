import QtQuick 1.0

Rectangle {
    id: albumDelegate
    opacity: 0.7
    width: 200; height: 200
    scale: PathView.iconScale
    z: PathView.view.zLevel(index)
    color: Qt.rgba(0.5+(PathView.view.count - number)*Math.random()/PathView.view.count,
                   0.3+number*Math.random()/PathView.view.count, 0.3*Math.random(), 1.0)
    Keys.onEnterPressed: clicked()
    Keys.onReturnPressed: clicked()
    signal clicked
    Text {
        smooth: true
        color: "white"
        font.pixelSize: 30
        text: "ALBUM\n" + album
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (PathView.view.currentIndex == index)
                albumDelegate.clicked()
            PathView.view.currentIndex = index
        }
    }
}
