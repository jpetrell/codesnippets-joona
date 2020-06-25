#include "linegraph.h"
#include <QtQuick/QSGGeometryNode>
#include <QtQuick/QSGFlatColorMaterial>

class LineNode : public QSGGeometryNode
{
public:
    LineNode();

    void updateGeometry(const QRectF &bounds, const QList<qreal> &values, float lineWidth, const QColor &color);

    QSGGeometry m_geometry;
    QSGFlatColorMaterial m_material;
};

LineNode::LineNode()
    : m_geometry(QSGGeometry::defaultAttributes_Point2D(), 0)
{
    setGeometry(&m_geometry);
    m_geometry.setDrawingMode(GL_LINES);

    m_material.setFlag(QSGMaterial::Blending);
    setMaterial(&m_material);
}

void LineNode::updateGeometry(const QRectF &bounds, const QList<qreal> &values, float lineWidth, const QColor &color)
{
    m_geometry.allocate(2 * values.size());

    float x = bounds.x();
    float y = bounds.y();
    float width = bounds.width();
    float height = bounds.height() - lineWidth;

    float dx = width / (values.size() - 1);

    QSGGeometry::Point2D *data = m_geometry.vertexDataAsPoint2D();

    for (int i = 0; i < values.size() - 1; ++i) {
        data[2*i].set(x + dx * i, y + height - values.at(i) * height);
        data[2*i + 1].set(x + dx * (i + 1), y + height - values.at(i + 1) * height);
    }

    m_material.setColor(color);
    m_geometry.setLineWidth(lineWidth);

    markDirty(QSGNode::DirtyGeometry);
}

LineGraph::LineGraph()
    : m_arrayChanged(false)
    , m_geometryChanged(false)
    , m_lineWidth(1.0f)
{
    setFlag(ItemHasContents, true);
}

float LineGraph::lineWidth() const
{
    return m_lineWidth;
}

void LineGraph::setLineWidth(float lineWidth)
{
    if (m_lineWidth != lineWidth) {
        m_lineWidth = lineWidth;
        update();
        emit lineWidthChanged();
    }
}

QVariantList LineGraph::values() const
{
    return m_values;
}

void LineGraph::setValues(const QVariantList &values)
{
    m_values = values;
    m_array.clear();
    for (const QVariant &value : values) {
        m_array.append(value.toReal());
    }
    m_arrayChanged = true;
    update();
}

QColor LineGraph::color() const
{
    return m_color;
}

void LineGraph::setColor(const QColor &color)
{
    if (m_color != color) {
        m_color = color;
        update();
        emit colorChanged();
    }
}

void LineGraph::geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry)
{
    m_geometryChanged = true;
    update();
    QQuickItem::geometryChanged(newGeometry, oldGeometry);
}

QSGNode *LineGraph::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *)
{
    LineNode *n = static_cast<LineNode *>(oldNode);

    QRectF rect = boundingRect();

    if (rect.isEmpty()) {
        delete n;
        return 0;
    }

    if (!n) {
        n = new LineNode();
    }

    if (m_geometryChanged || m_arrayChanged || m_lineWidth != n->m_geometry.lineWidth()
            || m_color != n->m_material.color()) {
        n->updateGeometry(rect, m_array, m_lineWidth, m_color);
    }

    m_geometryChanged = false;
    m_arrayChanged = false;

    return n;
}
