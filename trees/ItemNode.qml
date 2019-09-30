import QtQuick 2.0
import "components"

Node {
    id: node
    property string text
    property color color: "transparent"
    content: ItemNodeItem {
        text: node.text
        color: node.color
    }
}
