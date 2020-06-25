#include <QGuiApplication>
#include <QQuickView>
#include "linegraph.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;

    qmlRegisterType<LineGraph>("LineGraph", 1, 0, "LineGraph");

    view.setSource(QUrl::fromLocalFile(QLatin1String("linegraph.qml")));
    view.show();

    return app.exec();
}
