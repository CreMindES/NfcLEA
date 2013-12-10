#ifndef APP_H
#define APP_H

#include <QObject>
#include <QUrl>

#include "applogger.h"
#include "ndefmanager.h"

class App : public QObject
{
    Q_OBJECT
public:
    explicit App(QObject *parent = 0);

    AppLogger appLogger;
    NdefManager *ndefManager;
    
signals:
    
public slots:
    void onNfcTagUriRecordRead(QString Uid, QUrl url);
    
};

#endif // APP_H
