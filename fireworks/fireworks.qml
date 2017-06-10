import QtQuick 2.6
import "components"

Rectangle {
    readonly property int unit: 2
    readonly property int small: 6*unit
    readonly property int medium: 2*small
    readonly property int large: 2*medium
    readonly property int huge: 2*large

    function round(value) {
        return 2*unit*Math.round(0.5*value/unit)
    }

    width: content.width + 2*huge
    height: content.height + 2*huge
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#222222"
        }
        GradientStop {
            position: 1.0
            color: "#111111"
        }
    }

    Item {
        id: content
        width: 9*large
        height: 9*large
        anchors.centerIn: parent

        Repeater {
            model: 12
            property var existing: []
            function overlap(a, b) {
                var m = unit*4
                var A = Qt.rect(a.x - m, a.y - m, a.width + 2*m, a.height + 2*m)
                var B = Qt.rect(b.x - m, b.y - m, b.width + 2*m, b.height + 2*m)
                return (A.x + A.width > B.x) && (B.x + B.width > A.x) && (A.y + A.height > B.y) && (B.y + B.height > A.y)
            }

            Component.onCompleted: {
                for (var i = 0; i < count; i++) {
                    var item = itemAt(i)

                    var overlaps = true
                    var maxTries = 20
                    var tries = 0
                    while (overlaps) {
                        overlaps = false
                        item.x = round(Math.random()*parent.width - item.width/2)
                        item.y = round(Math.random()*parent.height - item.height/2)
                        for (var j = 0; j < existing.length; j++) {
                            var other = existing[j]
                            if (overlap(item, other)) {
                                overlaps = true
                                tries = tries + 1
                                break
                            }
                        }
                        if (tries >= maxTries) {
                            item.visible = false
                            break
                        }
                    }
                    if (!overlaps) existing.push(item)
                }
            }

            Firework {
                x: Math.random()*parent.width - width/2
                y: Math.random()*parent.height - height/2
                width: round(Math.round(3+5*Math.random())*medium)
                height: round(width*(0.7+0.6*Math.random()))
            }
        }
    }
}
