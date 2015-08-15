import QtQuick 2.0

Item {
    id: node

    width: 16*unit
    objectName: "node"

    property bool root: !(parent && parent.objectName === "node")
    property real spacing: 6*unit
    property int depth
    property int maxDepth
    property string text
    property color color: "transparent"
    property int childrenCount

    Component.onCompleted: if (root) create(parent)

    function create(parentItem) {
        var item = component.createObject(parentItem, {"node": node})
        if (!root) {
            depth = parent.depth + 1
        }

        for (var i = 0; i < children.length; i++) {
            var child = children[i]
            if (child.objectName === "node") {
                child.create(item.layout)
            }
        }
        childrenCount = item.layout.children.length

        if (parent.objectName === "node") {
            parent.maxDepth = Math.max(parent.maxDepth, maxDepth, depth)
        }
        return item
    }

    Component {
        id: component
        NodeItem {}
    }
}
