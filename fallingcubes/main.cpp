#include <QtGui/QApplication>
#include <qdeclarativeview3d.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView3D view;
    view.setSource(QUrl::fromLocalFile(QLatin1String("fallingcubes.qml")));

    if (QApplication::arguments().contains(QLatin1String("-maximize")))
        view.showMaximized();
    else if (QApplication::arguments().contains(QLatin1String("-fullscreen")))
        view.showFullScreen();
    else
        view.show();

    return app.exec();
}
