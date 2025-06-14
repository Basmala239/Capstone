import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SupervisorHomeViewBody extends StatelessWidget {
  const SupervisorHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ChartCard(title: 'Team Progress', subtitle: 'Completion Rate', data: [80, 60, 20, 70, 40, 90]),
            SizedBox(height: 16),
            ChartCard(title: 'Number of Student in each Teams', subtitle: 'Number of students Per Team', data: [10, 8, 3, 9, 6, 11], barColor: Colors.deepPurple),
            SizedBox(height: 16),
            ChartCard(title: 'Meeting Frequency Per Team', subtitle: 'Meetings Per Team', data: [5, 7, 2, 6, 4, 8], barColor: Colors.lightBlue),
          ],
        ),
      ),
    );
  }
}

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

