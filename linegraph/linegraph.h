#ifndef LINEGRAPH_H
#define LINEGRAPH_H

#include <QQuickItem>

class LineGraph : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(float lineWidth READ lineWidth WRITE setLineWidth NOTIFY lineWidthChanged)
    Q_PROPERTY(QVariantList values READ values WRITE setValues CONSTANT)

public:
    LineGraph();

    QColor color() const;
    void setColor(const QColor &color);
    float lineWidth() const;
    void setLineWidth(float lineWidth);
    QVariantList values() const;
    void setValues(const QVariantList &values);

protected:
    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);
    void geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry);

signals:
    void colorChanged();
    void lineWidthChanged();

private:
    QVariantList m_values;
    QList<qreal> m_array;

    bool m_arrayChanged;
    bool m_geometryChanged;
    QColor m_color;
    float m_lineWidth;
};

QML_DECLARE_TYPE(LineGraph)

#endif // LINEGRAPH_H
