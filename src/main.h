#ifndef MAIN
#define MAIN

#include <QObject>

class Main : public QObject
{
    Q_OBJECT


public:
    void createIndicator();
    void createNotification();
};

#endif // MAIN

