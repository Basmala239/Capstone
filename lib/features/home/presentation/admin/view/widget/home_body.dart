import 'package:flutter/material.dart';

import '../../../../../../resources/text_styles.dart';
import '../../../view/widgets/card.dart';
import '../../../view/widgets/chart_card.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard',
              style: TextStyles.black22W500,),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: [
                  dashboardCard(icon: Icons.groups_2_outlined,
                      progress: 15,
                      pre: false,
                      title: 'Team'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.trending_up,
                      progress: 60,
                      pre: true,
                      title: 'Overall Progress'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.pie_chart_outline,
                      progress: 5,
                      pre: false,
                      title: 'Average Meeting/Team'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.emoji_events_outlined,
                      progress: 10,
                      pre: false,
                      title: 'ATop Student'),
                ],
              ),
            ),
            SizedBox(height: 16),


            ChartCard(title: 'Number of students Per Team',
                subtitle: 'Team ID',
                data: [10, 8, 3, 9, 6, 11],
                barColor: Colors.deepPurple),
            SizedBox(height: 16),

            ChartCard(title: 'Team Progress',
                subtitle: 'Team ID',
                data: [80, 60, 20, 70, 40, 90]),
            SizedBox(height: 16),

            ChartCard(title: 'Meeting Frequency Per Team',
                subtitle: 'Team ID',
                data: [5, 7, 2, 6, 4, 8],
                barColor: Colors.lightBlue),
              SizedBox(height: 16),

            ChartCard(title: 'Top 10 Students Tasks Contribution',
                subtitle: 'Student ID',
                data: [1,2,8,4,10,6,7,8,9,10],
                barColor: Colors.deepOrangeAccent),
            //
            //  Text('Meeting Attendance Per Team',
            //    style: TextStyles.black22W500,),
            SizedBox(height: 10),

          ],
        ),
      )
    ;
  }
}