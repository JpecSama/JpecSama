import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class ReviewGraph extends StatelessWidget {
  final List<Flashcard> flashcards;

  const ReviewGraph({super.key, required this.flashcards});

  Map<int, int> getHourlyCounts() {
    Map<int, int> hourlyCounts = {};
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    for (int i = 0; i < 24; i++) {
      hourlyCounts[(currentHour + i) % 24] =
          (hourlyCounts[(currentHour + i) % 24] ?? 0);
    }
    for (var flashcard in flashcards) {
      DateTime date = flashcard.nextAvailableAt;
      if (date.isBefore(now)) {
        hourlyCounts[currentHour] = (hourlyCounts[currentHour] ?? 0) + 1;
      }
      int hour = flashcard.nextAvailableAt.hour;
      hourlyCounts[hour] = (hourlyCounts[hour] ?? 0) + 1;
    }
    return hourlyCounts;
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    int currentHour = DateTime.now().hour;
    int val = currentHour - value.toInt();
    String text;

    if (val % 4 == 0) {
      text = '${value.toInt()}';
    } else {
      text = '';
    }

    return SideTitleWidget(
      angle: pi / 8,
      axisSide: meta.axisSide,
      child: Text(text.isNotEmpty ? "$text:00" : '', style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
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
      child: AspectRatio(
        aspectRatio: 1.66,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            int maxY = getHourlyCounts().values.reduce(max);
            return BarChart(
              BarChartData(
                maxY: maxY + 1,
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
                      interval: 4.0,
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
                  checkToShowHorizontalLine: (value) => value % 1 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: sumiIro.withAlpha(50),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: true,
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
    Map<int, int> hourlyCounts = getHourlyCounts();

    List<BarChartGroupData> barGroups = [];
    hourlyCounts.forEach((hour, count) {
      barGroups.add(
        BarChartGroupData(
          x: hour,
          barsSpace: barsSpace,
          barRods: [
            BarChartRodData(
              toY: count.toDouble(),
              borderRadius: BorderRadius.zero,
              width: barsWidth,
              color: ebicha,
            ),
          ],
        ),
      );
    });

    return barGroups;
  }
}
