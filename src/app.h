#ifndef APP_H
#define APP_H

#include <QObject>

#include "applogger.h"

class App : public QObject
{
    Q_OBJECT
public:
    explicit App(QObject *parent = 0);

    AppLogger appLogger;
    
signals:
    
public slots:
    
};

#endif // APP_H
