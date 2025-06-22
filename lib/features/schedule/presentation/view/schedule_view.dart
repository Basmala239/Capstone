import 'package:capstone/features/schedule/presentation/view/widget/schedule_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../widgets/background.dart';
import '../../../../widgets/custom_appbar.dart';
import 'add_meeting/view/add_meeting_view.dart';


class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Schedule', context),
      body: Stack(
        children: [
          Background(),
          ScheduleViewBody(),
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: ColorManager.blueCC,
        onPressed: (){
          //createUser(token);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMeetingView()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

