import QtQuick 1.0

PathView {
    id: horizontalPathView
    focus: true
    highlight: Item {}
    pathItemCount: 11
    preferredHighlightBegin: 0.5; preferredHighlightEnd: 0.5
    path: Path {
        startX: -400; startY: horizontalPathView.height/2-70
        PathAttribute { name: "iconScale"; value: 0.5 }
        PathQuad {
            x: horizontalPathView.width/2
            y: horizontalPathView.height/2-20
            controlX: horizontalPathView.width/4
            controlY: horizontalPathView.height/2-45
        }
        PathAttribute { name: "iconScale"; value: 1.0 }
        PathQuad {
            x: horizontalPathView.width+400
            y: horizontalPathView.height/2-70
            controlX: 3*horizontalPathView.width/4
            controlY: horizontalPathView.height/2-45
        }
        PathAttribute { name: "iconScale"; value: 0.5 }
    }
    Keys.onLeftPressed: decrementCurrentIndex()
    Keys.onRightPressed: incrementCurrentIndex()
    function zLevel(index) {
        var dist = Math.abs((currentIndex - index) % count)
        if (dist > (pathItemCount/2.0 + 1))
            dist = count - dist
        return Math.floor(pathItemCount/2.0) - dist
    }
}
