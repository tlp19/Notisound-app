import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

/// A card displaying analytics on a chart, with a label
class AnalyticsBarChart extends StatefulWidget {
  const AnalyticsBarChart(
      {required this.label,
      required this.dataMode,
      required this.isar,
      Key? key})
      : super(key: key);

  final String label;
  final String dataMode;
  final Isar isar;

  @override
  State<StatefulWidget> createState() => AnalyticsBarChartState();
}

class AnalyticsBarChartState extends State<AnalyticsBarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 4, 10),
              child: Text(
                widget.label,
                style: const TextStyle(
                    color: Color.fromARGB(255, 70, 70, 70),
                    fontWeight: FontWeight.bold),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.7,
              child: _BarChart(isar: widget.isar, dataMode: widget.dataMode),
            )
          ],
        ));
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({required this.dataMode, required this.isar, Key? key})
      : super(key: key);

  final String dataMode;
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        gridData: FlGridData(show: false),
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Color.fromARGB(255, 71, 98, 131),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color.fromARGB(255, 44, 63, 85),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 20,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Mn';
              case 1:
                return 'Te';
              case 2:
                return 'Wd';
              case 3:
                return 'Tu';
              case 4:
                return 'Fr';
              case 5:
                return 'St';
              case 6:
                return 'Sn';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                y: 8,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                y: 10,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                y: 14,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                y: 15,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                y: 13,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                y: 10,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                y: 10,
                width: 12,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
