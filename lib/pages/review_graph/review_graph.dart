import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class ReviewGraph extends StatelessWidget {
  final List<Flashcard> flashcards;

  const ReviewGraph({super.key, required this.flashcards});

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      default:
        text = '${value.toInt()}';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    // if (value == meta.max) {
    //   return Container();
    // }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      // decoration: BoxDecoration(
      //   border: Border.all(),
      // ),
      child: AspectRatio(
        aspectRatio: 1.66,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;

            return BarChart(
              BarChartData(
                borderData: FlBorderData(
                  border: Border.all(),
                ),
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: leftTitles,
                      interval: 1.0,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: sumiIro.withAlpha(50),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                barGroups: getData(barsWidth, barsSpace),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    Map<int, int> hourlyCounts = {};
    for (int i = 0; i < 24; i++) {
      hourlyCounts[i] = (hourlyCounts[i] ?? 0);
    }
    for (var flashcard in flashcards) {
      int hour = flashcard.nextAvailableAt!.hour;
      hourlyCounts[hour] = (hourlyCounts[hour] ?? 0) + 1;
    }

    List<BarChartGroupData> barGroups = [];
    hourlyCounts.forEach((hour, count) {
      barGroups.add(BarChartGroupData(x: hour, barsSpace: barsSpace, barRods: [
        BarChartRodData(
          toY: count.toDouble(),
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ]));
    });

    return barGroups;
  }
}
