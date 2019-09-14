import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtCharts 2.1
import QtQuick.Window 2.2

Item {
    id:root
    property int hpW: 0
    property int hpH: 0
    property int hpX: 0
    property int hpY: 0
    ChBeBackground{
        id:backgrCtrl
        bagrW: root.hpW
        bagrH: root.hpH
        bagrX: root.hpX
        bagrY: root.hpY
        gradColorStart: "white"
        gradColorStop: "black"

    }
    /*
    Rectangle{
        width: 800
        height: 200
        x:0
        y:0
        border.color: "black"
        border.width: 2
        radius: 4
        antialiasing: false
        color: "Transparent"
        ChBeWeatherTableau{
        }
    }
    */

    Rectangle{
        id:dataView
        width: 800
        height: 470
        x: 0
        y: 0
        color: "black"

        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false

        Connections{
            target:weatherbridge

            onSendWeatherData0: {
                tempMax.append(0,maxTemp);
                tempMin.append(0,minTemp);
                speedWind.append(0,windSpeed);
                //rain.append(0,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(0,cloudiness);
            }
            onSendWeatherData1: {
                tempMax.append(3,maxTemp);
                tempMin.append(3,minTemp);
                speedWind.append(3,windSpeed);
                //rain.append(3,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(3,cloudiness);
            }
            onSendWeatherData2: {
                tempMax.append(6,maxTemp);
                tempMin.append(6,minTemp);
                speedWind.append(6,windSpeed);
                //rain.append(6,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(6,cloudiness);
            }
            onSendWeatherData3: {
                tempMax.append(9,maxTemp);
                tempMin.append(9,minTemp);
                speedWind.append(9,windSpeed);
                //rain.append(9,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(9,cloudiness);
            }
            onSendWeatherData4: {
                tempMax.append(12,maxTemp);
                tempMin.append(12,minTemp);
                speedWind.append(12,windSpeed);
                //rain.append(12,rainLitre+snow);

                rainfall.append(rainLitre+snow)
                //rainfall.append(2, rainLitre+snow);

                //cloud.append(12,cloudiness);
            }
            onSendWeatherData5: {
                tempMax.append(15,maxTemp);
                tempMin.append(15,minTemp);
                speedWind.append(15,windSpeed);
                //rain.append(15,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(15,cloudiness);
            }
            onSendWeatherData6: {
                tempMax.append(18,maxTemp);
                tempMin.append(18,minTemp);
                speedWind.append(18,windSpeed);
                //rain.append(18,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(18,cloudiness);
            }
            onSendWeatherData7: {
                tempMax.append(21,maxTemp);
                tempMin.append(21,minTemp);
                speedWind.append(21,windSpeed);
                //rain.append(21,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(21,cloudiness);
            }
            onSendWeatherData8: {
                tempMax.append(24,maxTemp);
                tempMin.append(24,minTemp);
                speedWind.append(24,windSpeed);
                //rain.append(24,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(24,cloudiness);
            }
            onSendWeatherData9: {
                tempMax.append(27,maxTemp);
                tempMin.append(27,minTemp);
                speedWind.append(27,windSpeed);
                //rain.append(27,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append27;
            }
            onSendWeatherData10: {
                tempMax.append(30,maxTemp);
                tempMin.append(30,minTemp);
                speedWind.append(30,windSpeed);
                //rain.append(30,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(30,cloudiness);
            }
            onSendWeatherData11: {
                tempMax.append(33,maxTemp);
                tempMin.append(33,minTemp);
                speedWind.append(33,windSpeed);
                //rain.append(33,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(33,cloudiness);
            }
            onSendWeatherData12: {
                tempMax.append(36,maxTemp);
                tempMin.append(36,minTemp);
                speedWind.append(36,windSpeed);
                //rain.append(36,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(36,cloudiness);
            }
            onSendWeatherData13: {
                tempMax.append(39,maxTemp);
                tempMin.append(39,minTemp);
                speedWind.append(39,windSpeed);
                //rain.append(39,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(39,cloudiness);
            }
            onSendWeatherData14: {
                tempMax.append(42,maxTemp);
                tempMin.append(42,minTemp);
                speedWind.append(42,windSpeed);
                //rain.append(42,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(42,cloudiness);
            }
            onSendWeatherData15: {
                tempMax.append(45,maxTemp);
                tempMin.append(45,minTemp);
                speedWind.append(45,windSpeed);
                //rain.append(45,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(45,cloudiness);
            }
            onSendWeatherData16: {
                tempMax.append(48,maxTemp);
                tempMin.append(48,minTemp);
                speedWind.append(48,windSpeed);
                //rain.append(48,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(48,cloudiness);
            }
            onSendWeatherData17: {
                tempMax.append(51,maxTemp);
                tempMin.append(51,minTemp);
                speedWind.append(51,windSpeed);
                //rain.append(51,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(51,cloudiness);
            }
            onSendWeatherData18: {
                tempMax.append(54,maxTemp);
                tempMin.append(54,minTemp);
                speedWind.append(54,windSpeed);
                //rain.append(54,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(54,cloudiness);
            }
            onSendWeatherData19: {
                tempMax.append(57,maxTemp);
                tempMin.append(57,minTemp);
                speedWind.append(57,windSpeed);
                //rain.append(57,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(57,cloudiness);
            }
            onSendWeatherData20: {
                tempMax.append(60,maxTemp);
                tempMin.append(60,minTemp);
                speedWind.append(60,windSpeed);
                //rain.append(60,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(60,cloudiness);
            }
            onSendWeatherData21: {
                tempMax.append(63,maxTemp);
                tempMin.append(63,minTemp);
                speedWind.append(63,windSpeed);
                //rain.append(63,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(63,cloudiness);
            }
            onSendWeatherData22: {
                tempMax.append(66,maxTemp);
                tempMin.append(66,minTemp);
                speedWind.append(66,windSpeed);
                //rain.append(66,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(66,cloudiness);
            }
            onSendWeatherData23: {
                tempMax.append(69,maxTemp);
                tempMin.append(69,minTemp);
                speedWind.append(69,windSpeed);
                //rain.append(69,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(69,cloudiness);
            }
            onSendWeatherData24: {
                tempMax.append(72,maxTemp);
                tempMin.append(72,minTemp);
                speedWind.append(72,windSpeed);
                //rain.append(72,rainLitre+snow);

                rainfall.append(rainLitre+snow);

                //cloud.append(cloudiness);
            }
            onSendRanges: {
                tempMax.clear();
                tempMin.clear();
                speedWind.clear();
                //rain.clear();

                //cloud.clear();
                axisYtemp.max = maxTemp;
                axisYtemp.min = minTemp;
                axisYtemp.tickCount = ((maxTemp - minTemp)/2)+1;
                axisYwind.max = maxWindSpeed;
                axisYwind.min = minWindSpeed;
                axisYwind.tickCount = ((maxWindSpeed - minWindSpeed)/2)+1
                axisYtest.max = maxRain;

            }


        }

        Rectangle{
            id:infoSwiping
            width: 800
            height: 450
            x: 0
            y: 0
            color:"gray"
            SwipeView {
                id: swipeViewForeCast
                anchors.fill: parent
                orientation: Qt.Vertical
                Page{
                    Rectangle{
                        id:infoTemp
                        width: 800
                        height: 450
                        x: 0
                        y: 0
                        color:"#404040"
                        ChartView {
                            id: chartView
                            anchors.fill: parent
                            antialiasing: true
                            backgroundColor: "#404040"
                            legend{
                                visible: false
                            }
                            legend.labelColor: "white"

                            title: "Temperatureforecast Casa Bechter [°C]"
                            titleColor: "white"
                            titleFont: Qt.font({pointSize: 24})

                            ValueAxis {
                                id: axisX
                                min: 0
                                max: 72
                                labelsColor: "white"
                                tickCount: 4
                                visible: true
                            }
                            ValueAxis {
                                id: axisYtemp
                                min: 0
                                max: 20
                                tickCount: 6
                                minorTickCount: 1
                                color: "blue"
                                labelsColor: "white"
                            }
                            SplineSeries {
                                id:tempMax
                                color: "red"
                                axisX: axisX
                                axisY: axisYtemp
                                name: "Max. Temp"
                                //visible: checkerTempOut.checked
                                width: 4
                            }
                            SplineSeries {
                                id:tempMin
                                color: "blue"
                                axisX: axisX
                                axisY: axisYtemp
                                name: "Min. Temp"
                                //visible: checkerTempIn.checked
                                width: 4
                            }
                        }
                    }
                }

                Page{
                    Rectangle{
                        id:infoWind
                        width: 800
                        height: 450
                        x: 0
                        y: 0
                        color:"#404040"
                        ChartView {
                            id: chartViewWind
                            anchors.fill: parent
                            antialiasing: true
                            backgroundColor: "#404040"
                            legend{
                                visible: false
                            }
                            legend.labelColor: "white"

                            title: "Windforecast Casa Bechter [m/s]"
                            titleColor: "white"
                            titleFont: Qt.font({pointSize: 24})

                            ValueAxis {
                                id: axisXWind
                                min: 0
                                max: 72
                                labelsColor: "white"
                                tickCount: 4
                                visible: true
                            }
                            ValueAxis {
                                id: axisYwind
                                min: 0
                                max: 20
                                color: "orange"
                                labelsColor: "white"

                            }
                            SplineSeries {
                                id:speedWind
                                color: "orange"
                                axisX: axisXWind
                                axisY: axisYwind
                                name: "Windspeed"
                                //visible: checkerTempOut.checked
                                width: 4
                            }
                        }
                    }
                }
                /*
                Page{
                    Rectangle{
                        id:backgroundtest
                        width: 800
                        height: 450
                        x: 0
                        y: 0
                        color:"#606060"
                        ChartView {
                            id: chartViewRain
                            anchors.fill: parent
                            antialiasing: true
                            backgroundColor: "#606060"
                            legend{
                                visible: false
                            }
                            legend.labelColor: "white"

                            title: "Rainforecast Casa Bechter"
                            titleColor: "white"
                            titleFont: Qt.font({pointSize: 24})

                            ValueAxis {
                                id: axisXrain
                                min: 0
                                max: 72
                                labelsColor: "white"
                                tickCount: 4
                                visible: true
                            }



                            ValueAxis {
                                id: axisYrain
                                min: 0
                                max: 10
                                color: "lightblue"
                                labelsColor: "white"

                            }

                            SplineSeries {
                                id:rain
                                color: "lightblue"
                                axisX: axisXrain
                                axisY: axisYrain
                                name: "Rain"
                                //visible: checkerTempOut.checked
                                width: 2
                            }


                        }
                    }
                }
                */
                Page{
                    Rectangle{
                        id:raining
                        width: 800
                        height: 450
                        x: 0
                        y: 0
                        color:"#404040"
                        ChartView {
                            id: barViewRain
                            anchors.fill: parent
                            antialiasing: true
                            backgroundColor: "#404040"
                            legend{
                                visible: false
                            }
                            legend.labelColor: "white"

                            title: "Rainforecast Casa Bechter (3h Base in mm)"
                            titleColor: "white"
                            titleFont: Qt.font({pointSize: 24})
                            ValueAxis {
                                id: axisXtest
                                min: 0
                                max: 24
                                labelsColor: "white"
                                tickCount: 4
                                visible: true
                            }
                            ValueAxis {
                                id: axisYtest
                                min: 0
                                max: 10
                                color: "lightblue"
                                labelsColor: "white"

                            }

                            BarSeries  {
                                   id: test
                                   axisX: axisXtest
                                   axisY: axisYtest
                                   BarSet {
                                       id: rainfall
                                       label:"Rain"

                                   }

                            }
                         }
                    }
                }
            }
        }
    }

}
