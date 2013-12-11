#ifndef APPLOGENTRY_H
#define APPLOGENTRY_H

#include <QObject>
#include <QList>
#include <QDateTime>

#include "nfclogentry.h"
#include "rulelogentry.h"

class AppLogEntry : public QObject
{
    Q_OBJECT

public:
    explicit AppLogEntry(QObject *parent = 0);
    AppLogEntry(NfcLogEntry *newNfcLogEntry);

    NfcLogEntry *nfcLogEntry;
    RuleLogEntry *ruleLogEntry;

    // inline getter functions
    int logEntryType()  { return m_logEntryType; }
    QDateTime logTime() { return dateTime; }

    QString nfc_uid()   { return nfcLogEntry->getUid(); }
    QString nfc_alias() { return nfcLogEntry->getAlias(); }
//    NfcLogEntry* getNfcLogEntry() { return nfcLogEntry; }

    // Prototypes for new logs
//    void createAppLogEntry(nfcLogEntry newNfcLogEntry);
    void createNfcLogEntry(QString uid, QUrl url);
    void createRuleLogEntry(RuleLogEntry *newRuleLogEntry);

    enum LOG_ENTRY_TYPE {
        nfcTypeLogEntry,
        ruleTypeLogEntry
    };

private:
    QDateTime dateTime;

    int m_logEntryType;

//    QString text;
    QString uid;
    QUrl url;
    
signals:
    
public slots:
    
};

#endif // APPLOGENTRY_H
