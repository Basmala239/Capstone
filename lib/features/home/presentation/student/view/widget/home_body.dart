import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../view/widgets/chart_card.dart';
class StudentHomeViewBody extends StatelessWidget {
  const StudentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                            color: Colors.blue, value: 40, title: ''),
                        PieChartSectionData(
                            color: Colors.green, value: 35, title: ''),
                        PieChartSectionData(
                            color: Colors.red, value: 25, title: ''),
                      ],
                      centerSpaceRadius: 30,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Task Status Distribution', style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.blue),
                          SizedBox(width: 5),
                          Text('Completed - 40%')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.hourglass_bottom, color: Colors.green),
                          SizedBox(width: 5),
                          Text('In Progress - 35%')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red),
                          SizedBox(width: 5),
                          Text('Pending - 25%')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Project Progress',
                    style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1/2024'),
                    Text('2/2024'),
                    Text('3/2025'),
                    Text('4/2025'),
                    Text('5/2025'),
                    Text('6/2025'),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 20,
                  child: Row(
                    children: [
                      Expanded(flex: 10, child: Container(color: Colors.blue)),
                      Expanded(flex: 20, child: Container(color: Colors.blue)),
                      Expanded(flex: 20, child: Container(color: Colors.blue)),
                      Expanded(flex: 15, child: Container(color: Colors.blue)),
                      Expanded(flex: 15, child: Container(color: Colors.blue)),
                      Expanded(
                          flex: 20, child: Container(color: Colors.grey[200])),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Center(child: Text('Completion Rate (%)')),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            padding: EdgeInsets.all(12),

            child:
            Column(
                children: [
                  Center(child: Text('Cumulative Task Completion Over Time',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                    height: 240,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 0),
                              FlSpot(1, 25),
                              FlSpot(2, 50),
                              FlSpot(3, 35),
                              FlSpot(4, 80),
                            ],
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.blue,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const months = [
                                  '1/2024',
                                  '2/2024',
                                  '3/2025',
                                  '4/2025',
                                  '5/2025'
                                ];
                                return Text(months[value.toInt()]);
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                      ),
                    ),
                  )
                ]
            ),
          ),
          SizedBox(height: 30),
          ChartCard(title: 'Distribution of Time Taken to Complete Tasks',
              subtitle: 'Complete Tasks',
              data: [10, 8, 3, 9, 6, 11],
              barColor: Colors.deepPurple),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

