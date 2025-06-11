import 'package:flutter/material.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../data/report_model.dart';
class ReportViewBody extends StatelessWidget {
  const ReportViewBody({super.key,required this.report});
  final ReportModel report;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Title of project', report.title),
                const SizedBox(height: 8),
                _buildInfoRow('Supervisors', report.supervisorName),
                const SizedBox(height: 8),
                _buildInfoRow('Meeting Date', report.date),
                const SizedBox(height: 16),
                const Text(
                  'Topics Discussed in the meeting:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  report.topicsDiscussed??"No topics discussed",
                  softWrap: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tasks given to the students :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  report.tasks??"No tasks",
                  softWrap: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Attendance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildAttendanceTable(),
              ],
            )
        ));
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('$label :', style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 5, child: Text(value)),
      ],
    );
  }

  Widget _buildAttendanceTable() {
    final students = report.attendance;

    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(40),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(60),
        3: FlexColumnWidth(),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.grey),
          children: [
            TableCell(child: Center(child: Padding(padding: EdgeInsets.all(4), child: Text('Num')))),
            TableCell(child: Center(child: Padding(padding: EdgeInsets.all(4), child: Text('Name')))),
            TableCell(child: Center(child: Padding(padding: EdgeInsets.all(4), child: Text('Attend')))),
            TableCell(child: Center(child: Padding(padding: EdgeInsets.all(4), child: Text('Comment')))),
          ],
        ),
        ...students.map((student) {
          return TableRow(
            children: [
              Padding(padding: const EdgeInsets.all(4), child:Text((students.toList().indexOf(student)+1).toString())),
              Center(child: Padding(padding: const EdgeInsets.all(4), child: Text(student.studentName))),
              Center(child: Checkbox(value: student.present, onChanged: null)),
              Center(
                child: Text(student.comment??"No comment ", style: TextStyle(color: Colors.blue)),
              ),
            ],
          );
        }),
      ],

    );
  }
}


class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key, required this.report});

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('View Report', context),
      body: Stack(
        children: [
          Background(),
          ReportViewBody(report: report,)
        ],
      ),
    );
  }
}