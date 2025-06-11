import 'package:capstone/features/schedule/presentation/view/widget/schedule_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/background.dart';
import '../../../../widgets/custom_appbar.dart';


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
    );
  }
}

