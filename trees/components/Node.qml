import QtQuick 2.0

Item {
    id: node

    width: 16*unit
    objectName: "node"

    property bool root: !(parent && parent.objectName === "node")
    property real spacing: 6*unit
    property int depth
    property int maxDepth
    property int childrenCount
    property Component content
    property Item item

    Component.onCompleted: if (root) create(parent)

    function create(parentItem) {
        item = content.createObject(parentItem, {"node": node})

        if (item.objectName !== "nodeItem") {
            console.log("Error: Trying to create nodeItem of wrong type")
            return
        }

        console.log(content, "item", item, item.layout)

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
}
