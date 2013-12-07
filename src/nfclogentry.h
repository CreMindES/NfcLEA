#ifndef NFCLOGENTRY_H
#define NFCLOGENTRY_H

#include <QObject>
#include <QDateTime>
#include <QNdefMessage>

QTM_USE_NAMESPACE

class NfcLogEntry : public QObject
{
    Q_OBJECT
public:
    explicit NfcLogEntry(QObject *parent = 0);

    void storeDateTime();
    void setUid(QString readUid);
    void setNDefMessage(QNdefMessage readNDefmessage);
    void setAlias(QString newAlias);

private:
    QString alias;
    QString uid;
    QDateTime dateTime;
    QNdefMessage ndefMessage;
    
signals:
    
public slots:
    
};

#endif // NFCLOGENTRY_H
