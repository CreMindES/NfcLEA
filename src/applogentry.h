#ifndef APPLOGENTRY_H
#define APPLOGENTRY_H

#include <QObject>
#include <QDateTime>

class appLogEntry : public QObject
{
    Q_OBJECT
public:
    explicit appLogEntry(QObject *parent = 0);

    QDateTime Time;
    int logEntryType;

    enum LOG_ENTRY_TYPE {
        Nfc,
        Rule
    };
    
signals:
    
public slots:
    
};

#endif // APPLOGENTRY_H
