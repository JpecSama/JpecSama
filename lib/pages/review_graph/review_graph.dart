import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class ReviewGraph extends StatelessWidget {
  final List<Flashcard> flashcards;

  const ReviewGraph({super.key, required this.flashcards});

  Map<int, int> _computeHourlyCounts() {
    final now = DateTime.now();
    final currentHour = now.hour;
    final hourlyCounts = {
      for (int i = 0; i < 24; i++) (currentHour + i) % 24: 0
    };

    for (var flashcard in flashcards) {
      final hour = flashcard.nextAvailableAt.hour;
      if (flashcard.nextAvailableAt.isBefore(now)) {
        hourlyCounts[currentHour] = (hourlyCounts[currentHour] ?? 0) + 1;
      }
      hourlyCounts[hour] = (hourlyCounts[hour] ?? 0) + 1;
    }
    return hourlyCounts;
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    final int hour = value.toInt();
    return SideTitleWidget(
      angle: pi / 8,
      meta: meta,
      child: Text(hour % 4 == 0 ? "$hour:00" : '',
          style: const TextStyle(fontSize: 10)),
    );
  }

  Widget _buildLeftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      child: Text(meta.formattedValue, style: const TextStyle(fontSize: 10)),
    );
  }

  List<BarChartGroupData> _generateBarGroups(
      Map<int, int> hourlyCounts, double barsWidth, double barsSpace) {
    return hourlyCounts.entries
        .map(
          (entry) => BarChartGroupData(
            x: entry.key,
            barsSpace: barsSpace,
            barRods: [
              BarChartRodData(
                toY: entry.value.toDouble(),
                borderRadius: BorderRadius.zero,
                width: barsWidth,
                color: ebicha,
              ),
            ],
          ),
        )
        .toList();
  }

  BarChartData _buildChartData(
      Map<int, int> hourlyCounts, double barsWidth, double barsSpace) {
    final maxY = hourlyCounts.values.isNotEmpty
        ? hourlyCounts.values.reduce(max) + 1
        : 1;
    return BarChartData(
      maxY: maxY.toDouble(),
      borderData: FlBorderData(border: Border.all()),
      alignment: BarChartAlignment.center,
      barTouchData: BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 4.0,
            getTitlesWidget: _buildBottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _buildLeftTitles,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(
        show: true,
        checkToShowHorizontalLine: (value) => value % 1 == 0,
        getDrawingHorizontalLine: (_) =>
            FlLine(color: sumiIro.withAlpha(50), strokeWidth: 1),
        drawVerticalLine: true,
      ),
      barGroups: _generateBarGroups(hourlyCounts, barsWidth, barsSpace),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hourlyCounts = _computeHourlyCounts();
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.height * 0.75,
        ),
        child: AspectRatio(
          aspectRatio: 1.66,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final barsSpace = 4.0 * constraints.maxWidth / 400;
              final barsWidth = 8.0 * constraints.maxWidth / 400;
              return BarChart(
                  _buildChartData(hourlyCounts, barsWidth, barsSpace));
            },
          ),
        ),
      ),
    );
  }
}
