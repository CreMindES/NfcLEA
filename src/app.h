#ifndef APP_H
#define APP_H

#include <QObject>
#include <QUrl>

#include "applogmodel.h"
#include "ndefmanager.h"
#include "mytcpclient.h"

class App : public QObject
{
    Q_OBJECT
public:
    explicit App(QObject *parent = 0);

    //AppLogger appLogger;
    AppLogModel appLogModel;
    NdefManager *ndefManager;
    MyTcpClient *client;
    
signals:
    
public slots:
    void onNfcTagUriRecordRead(QString uid, QUrl url);
    
};

#endif // APP_H
