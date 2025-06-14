import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class StudentHomeViewBody extends StatelessWidget {
  const StudentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('home')
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: PieChart(
          //         PieChartData(
          //           sections: [
          //             PieChartSectionData(
          //               color: Colors.blue,
          //               value: 40,
          //               title: '',
          //             ),
          //             PieChartSectionData(
          //               color: Colors.green,
          //               value: 35,
          //               title: '',
          //             ),
          //             PieChartSectionData(
          //               color: Colors.red,
          //               value: 25,
          //               title: '',
          //             ),
          //           ],
          //           centerSpaceRadius: 30,
          //           sectionsSpace: 2,
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 20),
          //     Expanded(
          //       flex: 3,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text('Task Status Distribution',
          //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          //           SizedBox(height: 8),
          //           Row(
          //             children: [
          //               Icon(Icons.check_circle, color: Colors.blue),
          //               SizedBox(width: 5),
          //               Text('Completed - 40%'),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Icon(Icons.hourglass_bottom, color: Colors.green),
          //               SizedBox(width: 5),
          //               Text('In Progress - 35%'),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Icon(Icons.error_outline, color: Colors.red),
          //               SizedBox(width: 5),
          //               Text('Pending - 25%'),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 30),
          // Center(
          //   child: Text('Project Progress', style: TextStyle(fontWeight: FontWeight.bold)),
          // ),
          // SizedBox(height: 10),
          // Container(
          //   height: 200,
          //   padding: EdgeInsets.all(8),
          //   child: BarChart(
          //     BarChartData(
          //       barGroups: [
          //         makeGroupData(0, 10),
          //         makeGroupData(1, 30),
          //         makeGroupData(2, 50),
          //         makeGroupData(3, 65),
          //         makeGroupData(4, 80),
          //         makeGroupData(5, 85),
          //       ],
          //       titlesData: FlTitlesData(
          //         leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          //         bottomTitles: AxisTitles(
          //           sideTitles: SideTitles(
          //             showTitles: true,
          //             getTitlesWidget: (value, meta) {
          //               const months = ['1/2024', '2/2024', '3/2025', '4/2025', '5/2025', '6/2025'];
          //               return Text(months[value.toInt()]);
          //             },
          //           ),
          //         ),
          //       ),
          //       borderData: FlBorderData(show: false),
          //     ),
          //   ),
          // ),
          // Center(
          //   child: Text('Cumulative Task Completion Over Time',
          //       style: TextStyle(fontWeight: FontWeight.bold)),
          // ),
          // SizedBox(height: 10),
          // Container(
          //   height: 250,
          //   padding: EdgeInsets.all(8),
          //   child: LineChart(
          //     LineChartData(
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: [
          //             FlSpot(0, 0),
          //             FlSpot(1, 25),
          //             FlSpot(2, 50),
          //             FlSpot(3, 35),
          //             FlSpot(4, 80),
          //           ],
          //           isCurved: true,
          //           barWidth: 3,
          //           color: Colors.blue,
          //           dotData: FlDotData(show: true),
          //         ),
          //       ],
          //       titlesData: FlTitlesData(
          //         leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          //         bottomTitles: AxisTitles(
          //           sideTitles: SideTitles(
          //             showTitles: true,
          //             getTitlesWidget: (value, meta) {
          //               const months = ['1/2024', '2/2024', '3/2025', '4/2025', '5/2025'];
          //               return Text(months[value.toInt()]);
          //             },
          //           ),
          //         ),
          //       ),
          //       borderData: FlBorderData(show: true),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: Colors.blue)]);
  }
}
