import 'package:flutter/material.dart';

import '../../../../../../resources/text_styles.dart';
import '../../../view/widgets/card.dart';
import '../../../view/widgets/chart_card.dart';

class SupervisorHomeViewBody extends StatelessWidget {
  const SupervisorHomeViewBody({super.key});

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
                  dashboardCard(icon: Icons.trending_up,
                      progress: 60,
                      pre: true,
                      title: 'Overall Progress'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.groups_2_outlined,
                      progress: 15,
                      pre: false,
                      title: 'Team'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.pie_chart_outline,
                      progress: 5,
                      pre: false,
                      title: 'Average Meeting/Team'),
                  SizedBox(width: 10),
                  dashboardCard(icon: Icons.person_remove,
                      progress: 6,
                      pre: false,
                      title: 'Average Meeting Attend'),
                ],
              ),
            ),
            SizedBox(height: 16),

            Text('Team Progress',
              style: TextStyles.black22W500,),
            SizedBox(height: 10),
            ChartCard(title: 'Team Progress',
                subtitle: 'Completion Rate',
                data: [80, 60, 20, 70, 40, 90]),
            SizedBox(height: 16),

            Text('Number of Student in each Teams',
              style: TextStyles.black22W500,),
            SizedBox(height: 10),
            ChartCard(title: 'Number of Student in each Teams',
                subtitle: 'Number of students Per Team',
                data: [10, 8, 3, 9, 6, 11],
                barColor: Colors.deepPurple),
            SizedBox(height: 16),

            Text('Meeting Frequency Per Team',
              style: TextStyles.black22W500,),
            SizedBox(height: 10),
            ChartCard(title: 'Meeting Frequency Per Team',
                subtitle: 'Meetings Per Team',
                data: [5, 7, 2, 6, 4, 8],
                barColor: Colors.lightBlue),
           //  SizedBox(height: 16),
           //
           //  Text('Meeting Attendance Per Team',
           //    style: TextStyles.black22W500,),
            SizedBox(height: 10),

          ],
        ),
    );
  }
}

