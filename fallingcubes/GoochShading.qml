import Qt3D 1.0
import QtQuick 1.0

ShaderProgram {
    property color warmColor
    property color coolColor
    vertexShader: "
        attribute highp vec4 qt_Vertex;
        attribute highp vec3 qt_Normal;

        uniform lowp vec4 warmColor;
        uniform lowp vec4 coolColor;

        uniform highp mat3 qt_NormalMatrix;
        uniform highp mat4 qt_ModelViewProjectionMatrix;
        uniform highp mat4 qt_ModelViewMatrix;

        varying float facingProjector;

        struct qt_SingleLightParameters {
            mediump vec4 position;
            mediump vec3 spotDirection;
            mediump float spotExponent;
            mediump float spotCutoff;
            mediump float spotCosCutoff;
            mediump float constantAttenuation;
            mediump float linearAttenuation;
            mediump float quadraticAttenuation;
        };
        uniform qt_SingleLightParameters qt_Light;

        void main(void)
        {
            highp vec4 vertex = qt_ModelViewMatrix * qt_Vertex;
            highp vec3 normal = normalize(qt_NormalMatrix * qt_Normal);
            highp vec3 light = normalize(qt_Light.position.xyz - vertex.xyz);
            facingProjector = clamp(dot(normal, light), 0.0, 1.0);
            gl_Position = qt_ModelViewProjectionMatrix * qt_Vertex;
        }
    "
    fragmentShader: "
        uniform lowp vec4 warmColor;
        uniform lowp vec4 coolColor;

        varying float facingProjector;

        void main(void)
        {
            highp float ratio = 0.5 * (facingProjector + 1.0);
            gl_FragColor = mix(warmColor, coolColor, ratio);
        }
    "
}
