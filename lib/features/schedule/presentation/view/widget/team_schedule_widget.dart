import 'package:flutter/material.dart';

import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../date/model/meeting_model.dart';

Widget teamScheduleWidget(MeetingModel teamSchedule) {
  return Card(
      color: ColorManager.blueD8,
      child: Padding(padding: EdgeInsets.all(18),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${teamSchedule.teamId}',
                    style: TextStyles.white18w400,),
                  SizedBox(width: 10),
                  Text(teamSchedule.title,
                    style: TextStyles.white18w400,),

                ],
              ),
              Divider(),
              Text('Meeting appointment:',
                style: TextStyles.white18w400,),
              Text('${teamSchedule.startTime}, ${teamSchedule.endTime}',
                style: TextStyle(color: Colors.white),),
            ],
          )
      )
  );
}