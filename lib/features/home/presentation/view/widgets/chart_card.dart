import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class ChartCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<double> data;
  final Color barColor;

  const ChartCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.data,
    this.barColor = Colors.teal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('"$title"', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: data.asMap().entries.map((entry) {
                    int i = entry.key;
                    double value = entry.value;
                    return BarChartGroupData(x: i + 1, barRods: [
                      BarChartRodData(toY: value, color: barColor, width: 15)
                    ]);
                  }).toList(),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text(' ${value.toInt()} '),
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}