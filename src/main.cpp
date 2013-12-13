#include <QtGui/QApplication>
#include <QtDeclarative>
#include <QDeclarativeContext>

#include "qmlapplicationviewer.h"
#include "app.h"
#include "mytcpclient.h"
//#include "ndefmanager.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    App nfcLeaApp;

    QmlApplicationViewer viewer;

    QDeclarativeContext *context = viewer.rootContext();
    context->setContextProperty("nfcManager", nfcLeaApp.ndefManager);
    context->setContextProperty("appLogModel", &nfcLeaApp.appLogModel);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/nfclea/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
