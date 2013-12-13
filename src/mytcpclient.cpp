#include "mytcpclient.h"

MyTcpClient::MyTcpClient(QObject *parent) :
    QObject(parent)
{
    connect(&socket, SIGNAL(connected()), this, SLOT(onConnected()));
    connect(&socket, SIGNAL(disconnected()), this, SLOT(onDisconnected()));
}

MyTcpClient::~MyTcpClient()
{
    socket.close();
}

bool MyTcpClient::connectToServer(QString address, quint16 port)
{
    QHostAddress hostAddress(address);
    socketHostAddress = hostAddress;
    socketPort = port;
    if(connectTcpServer(socketHostAddress, socketPort))
        return true;
    else
        return false;
}

bool MyTcpClient::reConnectToServer()
{
    qDebug() << "Reconnecting to server...";
    if(connectTcpServer(socketHostAddress, socketPort)) {
        qDebug() << "Reconnected.";
        return true;
    }
    else {
        qDebug() << "Couldn't reconnect.";
        return false;
    }
}

bool MyTcpClient::connectTcpServer(QHostAddress hostAddress, quint16 port)
{
    socket.connectToHost(hostAddress, port);
    if(socket.waitForBytesWritten(1000)) {
        qDebug() << "Connecting to server...";
        return true;
    }
    else {
        qDebug() << "Failed to connect...";
        return false;
    }
}

void MyTcpClient::onConnected()
{
    qDebug() << "Connected to: 192.168.2.105";
    socket.write("Hello world", 12);
}

void MyTcpClient::onDisconnected()
{
    qDebug() << "Server disconnected...";
}

void MyTcpClient::sendNfcUid(QString uid)
{
    qDebug() << "Sending NFC UID...";
    if(socket.isOpen()) {
        if(socket.write(uid.toUtf8(), qstrlen(uid.toUtf8()))) {
            qDebug() << "NFC UID sent to Server";
        }
        else {
            qDebug() << "oo";
        }
    }
    else if(reConnectToServer()) {
        socket.write(uid.toUtf8(), qstrlen(uid.toUtf8()));
        qDebug() << "NFC UID sent to server after reconnecting";
    }
    else {
        qDebug() << "no connection to server\n";
    }
}
