#ifndef NEWSTICKERDATA_H
#define NEWSTICKERDATA_H

#include <QObject>

class NewsTickerData
{
public:
    NewsTickerData();
    QString date[64];
    QString title[64];
    QString description[64];
};

#endif // NEWSTICKERDATA_H
