import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:c_square2/palette.dart';
import 'package:c_square2/country.dart';

class LineChartDeathsWidget extends StatelessWidget {
  final Datum country;
  LineChartDeathsWidget({this.country});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 64, top: 32, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 7,
          minY: 0.9999 * country.deathsm7.toDouble(),
          maxY: 1.0001 * country.deaths.toDouble(),
          titlesData: getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: kExtraLightPrimaryColor,
                strokeWidth: 0.1,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: kExtraLightPrimaryColor,
                strokeWidth: 0.5,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: kExtraLightPrimaryColor, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: getLineData(),
              isCurved: true,
              curveSmoothness: 0.2,
              colors: [
                Colors.black,
              ],
              barWidth: 5,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: [
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlTitlesData getTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '7 Days Ago';
            case 3:
              return '4 Days Ago';
            case 7:
              return 'Today';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        interval: interval(),
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 8,
        ),
        reservedSize: 35,
        margin: 12,
      ),
    );
  }

  List<FlSpot> getLineData() {
    List<FlSpot> list = List<FlSpot>();
    list.add(
      FlSpot(7, (country.deaths).toDouble()),
    );
    list.add(
      FlSpot(6, (country.deathsm1).toDouble()),
    );
    list.add(
      FlSpot(5, (country.deathsm2).toDouble()),
    );
    list.add(
      FlSpot(4, (country.deathsm3).toDouble()),
    );
    list.add(
      FlSpot(3, (country.deathsm4).toDouble()),
    );
    list.add(
      FlSpot(2, (country.deathsm5).toDouble()),
    );
    list.add(
      FlSpot(1, (country.deathsm6).toDouble()),
    );
    list.add(
      FlSpot(0, (country.deathsm7).toDouble()),
    );

    return list;
  }

  double interval() {
    double interval;
    int range = country.deaths - country.deathsm7;
    if (range < 10) {
      interval = 1;
    } else if (range > 10 && range < 100) {
      interval = 10;
    } else if (range > 100 && range < 1000) {
      interval = 100;
    } else if (range > 1000 && range < 10000) {
      interval = 1000;
    } else if (range > 10000 && range < 100000) {
      interval = 10000;
    } else if (range > 100000 && range < 1000000) {
      interval = 100000;
    } else if (range > 1000000 && range < 10000000) {
      interval = 1000000;
    } else if (range > 10000000 && range < 100000000) {
      interval = 10000000;
    }
    return interval;
  }
}
