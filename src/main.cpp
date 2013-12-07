#include <QtGui/QApplication>
#include <QtDeclarative>

#include "qmlapplicationviewer.h"
#include "ndefmanager.h"
//#include "app.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    //App NfcLEA;

    QmlApplicationViewer viewer;
    qmlRegisterType<NdefManager>("Nfc", 1, 0, "NdefManager");
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/nfclea/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
