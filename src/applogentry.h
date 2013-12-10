#ifndef APPLOGENTRY_H
#define APPLOGENTRY_H

#include <QObject>
#include <QDateTime>

#include "nfclogentry.h"
#include "rulelogentry.h"

class AppLogEntry : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString uid READ nfc_uid NOTIFY nfc_uidChanged)
    Q_PROPERTY(QString test READ test_text)
    // Q_PROPERTY( NfcLogEntry nfcLogEntry READ getNcfLogEntry )

public:
    explicit AppLogEntry(QObject *parent = 0);
    AppLogEntry(NfcLogEntry *newNfcLogEntry);

    QDateTime dateTime;
    int logEntryType;

    NfcLogEntry *nfcLogEntry;
    RuleLogEntry *ruleLogEntry;

    QString test_text() { return "jupi"; }

    QString nfc_uid() { return nfcLogEntry->getUid(); }
    QString nfc_alias() { return nfcLogEntry->getAlias(); }

//    void createAppLogEntry(nfcLogEntry newNfcLogEntry);
    void createNfcLogEntry(QString uid, QUrl url);
    void createRuleLogEntry(RuleLogEntry *newRuleLogEntry);
    NfcLogEntry* getNfcLogEntry() { return nfcLogEntry; }

    enum LOG_ENTRY_TYPE {
        nfcTypeLogEntry,
        ruleTypeLogEntry
    };

private:
    QString text;
    QString uid;
    QUrl url;
    
signals:
    void nfc_uidChanged();
    void logCountChanged();
    
public slots:
    
};

#endif // APPLOGENTRY_H
