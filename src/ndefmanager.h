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

    //Q_PROPERTY(bool nfcAvailability READ isNfcAvailable)

public:
    explicit NdefManager(QObject *parent = 0);

    Q_INVOKABLE bool isNfcAvailable();

private:
    QNearFieldManager *nfcManager;

    bool nfcAvailability;
    QString currentUID;

signals:
    void tagDetected(QString uid);
    void nfcTagUriRecordRead(QString uid, QUrl uri);
    void tagLost();
    void nfcReadTagUri(const QUrl& nfcTagUri);
    
public slots:

private slots:
    void onTargetDetected2(QNearFieldTarget *target);
    void onTargetDetected(const QNdefMessage &message, QNearFieldTarget *target);
    void onTargetLost(QNearFieldTarget *target);
    void onRecordRead(QNdefMessage message);
};

#endif // NDEFMANAGER_H
