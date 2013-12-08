#include <QtGui/QApplication>
#include <QtDeclarative>
#include <QDeclarativeContext>

#include "qmlapplicationviewer.h"
#include "app.h"
//#include "ndefmanager.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    App *nfcLeaApp = new App();

    QmlApplicationViewer viewer;

    //qmlRegisterType<NdefManager>("Nfc", 1, 0, "NdefManager");
    QDeclarativeEngine engine;
    QDeclarativeContext *context = viewer.rootContext();
    context->setContextProperty("nfcManager", nfcLeaApp->ndefManager);
    //qmlRegisterType<NfcLeaApp->ndefManager>("Nfc", 1, 0, "NdefManager");
    //QDeclarativeContext *context = viewer.rootContext();
    //context->setContextProperty("appLogModel", nfcLeaApp->appLogger->appLog);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/nfclea/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
