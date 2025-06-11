import 'package:flutter/material.dart';

import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../date/model/schedule_model.dart';

Widget teamScheduleWidget(ScheduleModel teamSchedule) {
  return Card(
      color: ColorManager.blueD8,
      child: Padding(padding: EdgeInsets.all(18),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(teamSchedule.teamImage),
                  ),
                  SizedBox(width: 10),
                  Text(teamSchedule.teamName,
                  style: TextStyles.white18w400,),
                ],
              ),
              Divider(),
              Text('Meeting appointment:',
                  style: TextStyles.white18w400,),
              Text('${teamSchedule.time}, ${teamSchedule.time}',
                style: TextStyle(color: Colors.white),),
            ],
          )
      )
  );
}