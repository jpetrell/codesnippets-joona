import Qt3D 2.0
import QtQuick 2.0
import Qt3D.Shapes 2.0

Item3D {
    id: fallingCube
    property color coolColor
    function reset() {
        yBehavior.enabled = false;
        fallingCube.y = 25
        yBehavior.enabled = true;
        fallingCube.x = 40*Math.random();
        fallingCube.y = -15
    }
    Component.onCompleted: y = -15
    x: 40*Math.random(); y: 30*Math.random()-10; z: 20*(Math.random()-0.5)
    Behavior on x { SmoothedAnimation { velocity: 2*Math.random() } }
    Behavior on y {
        id: yBehavior
        SmoothedAnimation { velocity: 6+Math.random()*6 }
    }
    Timer {
        interval: 100; repeat: true; running: true
        onTriggered: if (fallingCube.y < -9) fallingCube.reset()
    }
    Cube {
        scale: 2
        effect: GoochShading {
            coolColor: fallingCube.coolColor
            warmColor: Qt.rgba(0.9 + 0.1*Math.random(),
                               0.2 + 0.2*Math.random(),
                               0.2*Math.random())
        }
        transform: Rotation3D {
            axis: Qt.vector3d(Math.random(), Math.random(), Math.random())
            SequentialAnimation on angle {
                id: angleAnimation
                property real offset: 360*Math.random()
                property real duration: 3000+3000*Math.random()
                running: true; loops: Animation.Infinite
                NumberAnimation {
                    from: angleAnimation.offset; to: 360
                    duration: (360-angleAnimation.offset)*angleAnimation.duration/360
                }
                NumberAnimation {
                    from: 0; to: angleAnimation.offset
                    duration: angleAnimation.offset*angleAnimation.duration/360
                }
            }
        }
    }
}
