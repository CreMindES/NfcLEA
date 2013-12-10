#ifndef NFCLOGENTRY_H
#define NFCLOGENTRY_H

#include <QObject>

#include <QNdefMessage>
#include <QNdefNfcUriRecord>
#include <QNdefNfcTextRecord>
#include <QNdefRecord>

#include <QDateTime>
#include <QUrl>

QTM_USE_NAMESPACE

class NfcLogEntry : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ getUid)

public:
    // Constructors
    explicit NfcLogEntry(QObject *parent = 0);
    NfcLogEntry(QString newUid, QUrl newUrl, QObject *parent = 0);

    // Member methods
    void storeDateTime();

    // Getter methods
    QString getUid()    { return uid;   }
    QString getAlias()  { return alias; }
    QUrl    getUrl()    { return url;   }
    QNdefMessage getNdefMessage() { return ndefMessage; }

    // Setter methods
    void setUid(QString readUid);
    void setNDefMessage(QNdefMessage readNDefmessage);
    void setUrl(QUrl newUrl);
    void setAlias(QString newAlias);

    // ENUMs
    enum NFC_RECORD_TYPE {
        unknownRecordType,
        uriRecordType,
        textRecordType,
        smartPosterRecordType
    };

private:
    QString alias;
    QString uid;
    int recordType;
    QDateTime dateTime;
    QNdefMessage ndefMessage;
    QUrl url;
    
signals:
    
public slots:
    
};

#endif // NFCLOGENTRY_H
