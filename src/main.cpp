#include <QtGui/QApplication>
#include <QtDeclarative>
#include <QDeclarativeContext>

#include "qmlapplicationviewer.h"
#include "app.h"
//#include "ndefmanager.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    App nfcLeaApp;

    QmlApplicationViewer viewer;

//    nfcLeaApp.appLogger.appLog.append(new AppLogEntry(new NfcLogEntry("122345", QUrl("http://www.awesome.com"))));
    NfcLogEntry *testEntry = new NfcLogEntry("77777", QUrl("http://www.awesome.com"));
    AppLogEntry *testAppLogEntry = new AppLogEntry(testEntry);
    nfcLeaApp.appLogModel.addLogEntry(testAppLogEntry);
//    nfcLeaApp.appLogger.appLog.append(testAppLogEntry);


    /*
    QList<QObject*> appLog;
    appLog.append(new AppLogEntry(new NfcLogEntry("122345", QUrl("http://www.awesome.com"))));
    appLog.append(new AppLogEntry(new NfcLogEntry("123235", QUrl("http://www.awesome.com"))));
    appLog.append(new AppLogEntry(new NfcLogEntry("154545", QUrl("http://www.awesome.com"))));
    appLog.append(new AppLogEntry(new NfcLogEntry("167645", QUrl("http://www.awesome.com"))));
    */

//    qmlRegisterType<NdefManager>("Nfc", 1, 0, "NdefManager");
//    QDeclarativeEngine engine;
    QDeclarativeContext *context = viewer.rootContext();
    context->setContextProperty("nfcManager", nfcLeaApp.ndefManager);
    context->setContextProperty("appLogModel", &nfcLeaApp.appLogModel);

    //context->setContextProperty("appLogModel", (QObject*)nfcLeaApp->appLogger->appLog);
    //context->setContextProperty("appLogModel", QVariant::fromValue(nfcLeaApp.appLogger.appLog));
    //context->setContextProperty("appLogModel2", &nfcLeaApp.appLogger);
    //context->setContextProperty("appLogModel", (QObject*)nfcLeaApp.appLogger.appLog);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/nfclea/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
