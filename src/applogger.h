#ifndef APPLOGGER_H
#define APPLOGGER_H

#include <QObject>

class AppLogger : public QObject
{
    Q_OBJECT
public:
    explicit AppLogger(QObject *parent = 0);

    //void addAppLogEntry();
    
signals:
    
public slots:
    
};

#endif // APPLOGGER_H
