#ifndef APP_H
#define APP_H

#include <QObject>
#include <QSettings>
#include <QUrl>

#include "applogmodel.h"
#include "ndefmanager.h"
#include "mytcpclient.h"

class App : public QObject
{
    Q_OBJECT
public:
    explicit App(QObject *parent = 0);
    ~App();

    //AppLogger appLogger;
    AppLogModel appLogModel;
    NdefManager *ndefManager;
    MyTcpClient *client;
    
    Q_INVOKABLE void saveSettings();
signals:
    
public slots:
    void onNfcTagUriRecordRead(QString uid, QUrl url);
    
private:
    QSettings *appSettings;

    void loadSettings();

};

#endif // APP_H
