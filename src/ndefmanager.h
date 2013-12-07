#ifndef NDEFMANAGER_H
#define NDEFMANAGER_H

#include <QObject>

#include <qnearfieldmanager.h>
#include <qndeffilter.h>
#include <qnearfieldtarget.h>
#include <qndefmessage.h>
#include <QNdefRecord>
#include <QNdefNfcTextRecord>
#include <QNdefNfcUriRecord>
#include <QUrl>
#include <QDebug>

QTM_USE_NAMESPACE

class NdefManager : public QObject
{
    Q_OBJECT
public:
    explicit NdefManager(QObject *parent = 0);

private:
    QNearFieldManager *nfcManager;
    bool isNfcAvailabe;
    QString currentUID;

signals:
    void tagDetected(QString uid);
    void tagLost();
    void nfcReadTagUri(const QUrl& nfcTagUri);
    
public slots:

private slots:
    void targetDetected2(QNearFieldTarget *target);
    void targetDetected(const QNdefMessage &message, QNearFieldTarget *target);
    void targetLost(QNearFieldTarget *target);
    void readRecord(QNdefMessage message);
};

#endif // NDEFMANAGER_H
