import Qt3D 1.0
import QtQuick 1.0
import Qt3D.Shapes 1.0

Viewport {
    id: fallingCubes
    width: 800; height: 480
    property color coolColor: Qt.rgba(0.3 + 0.1*Math.random(),
                                      0.3 * Math.random(),
                                      0.5 + 0.1*Math.random())
    Item3D {
        x: -4.2; y: -1.62; scale: 0.23
        Quad {
            x: 18.4; y: 6.8; z: -10; scale: 18
            transform: Rotation3D {
                angle: 90; axis: Qt.vector3d(1.0, 0.0, 0.0)
            }
            effect: Effect {
                property real fade
                SequentialAnimation on fade {
                    id: fadeAnimation
                    property real offset: Math.random()
                    property real duration: 4000+4000*Math.random()
                    running: true; loops: Animation.Infinite
                    NumberAnimation {
                        from: 0.0; to: 1.0
                        duration: fadeAnimation.duration/2
                    }
                    NumberAnimation {
                        from: 1.0; to: 0.0
                        duration: fadeAnimation.duration/2
                    }
                }
                color: Qt.rgba(0.95 + 0.05*Math.random(),
                               0.5 + 0.2*fade,
                               0.1 + 0.1*Math.random())
            }
        }
        Repeater {
            model: 200
            FallingCube { coolColor: fallingCubes.coolColor }
        }
    }
}
