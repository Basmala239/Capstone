import 'package:capstone/features/schedule/presentation/view/widget/team_schedule_widget.dart';
import 'package:flutter/material.dart';
import '../../../date/model/meeting_model.dart';
class ScheduleViewBody extends StatefulWidget {
  const ScheduleViewBody({super.key});

  @override
  State<ScheduleViewBody> createState() => _ScheduleViewBodyState();
}

class _ScheduleViewBodyState extends State<ScheduleViewBody> {

  String selectedFrequency = 'Weekly';
  List<String> frequencies = ['Weekly', 'Daily', 'Monthly'];
  List<String> teamNames = ['Team name1', 'Team name2'];
  List<MeetingModel> schedule = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: selectedFrequency,
            items: frequencies.map((value) =>
                DropdownMenuItem(
                  value: value,
                  child: Text(value),
                )).toList(),
            onChanged: (val) => setState(() => selectedFrequency = val!),
          ),

          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: schedule.length,
                itemBuilder: (context, index) =>
                    teamScheduleWidget(schedule[index])
            ),
          ),
        ],
      ),
    );
  }
}

