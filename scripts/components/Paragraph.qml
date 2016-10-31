import QtQuick 2.0

Column {
    property alias title: titleLabel.text
    property alias description: descriptionLabel.text
    property string fontFamily
    property bool enlarge

    width: parent.width/grid.columns
    spacing: unit

    Text {
        id: titleLabel
        font.family: "Source Sans Pro"
        font.weight: Font.Light
        font.pixelSize: fontSizeLarge
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        color: primaryColor
    }

    Text {
        id: descriptionLabel
        font.pixelSize: (enlarge ? 1.2 : 1.0) * fontSizeMedium
        font.weight: Font.Light
        wrapMode: Text.Wrap
        width: parent.width
        color: primaryColor
        visible: text.length > 0
    }
}
