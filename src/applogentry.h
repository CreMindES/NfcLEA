#ifndef APPLOGENTRY_H
#define APPLOGENTRY_H

#include <QObject>
#include <QDateTime>

#include "nfclogentry.h"
#include "rulelogentry.h"

class AppLogEntry : public QObject
{
    Q_OBJECT
public:
    explicit AppLogEntry(QObject *parent = 0);

    QDateTime dateTime;
    int logEntryType;

    NfcLogEntry *nfcLogEntry;
    RuleLogEntry *ruleLogEntry;

//    void createAppLogEntry(nfcLogEntry newNfcLogEntry);
    void addNfcLogEntry(NfcLogEntry newNfcLogEntry, QString uid, QNdefMessage message, QString alias = 0);
    void addRuleLogEntry(RuleLogEntry newRuleLogEntry);

    enum LOG_ENTRY_TYPE {
        Nfc,
        Rule
    };
    
signals:
    
public slots:
    
};

#endif // APPLOGENTRY_H
