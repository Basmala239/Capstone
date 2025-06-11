import 'package:capstone/features/report/data/attendance_model.dart';
import 'package:capstone/features/report/data/report_model.dart';
import 'package:capstone/features/report/presentation/view/widgets/report_add_new_widget.dart';
import 'package:capstone/features/report/presentation/view/widgets/report_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/text_styles.dart';
import '../../../../../widgets/custom_buttons.dart';

class ReportBody extends StatelessWidget {
  ReportBody({super.key});

  final List<ReportModel>reports = [
    ReportModel('Archive System', 'Ahmed Abdallah', '11/15/2025',
        'recommendation system', 'update dashboard view', [
          AttendanceModel('Basma', true, 'create chat'),
          AttendanceModel('Ahmed', false, 'not attend at all'),
          AttendanceModel('Sabah', true, 'build profile page'),
        ]),
    ReportModel(
        'Water Quality', 'Ali Ahmed', '11/15/2025', 'Final stage', 'none', [
      AttendanceModel('Shams', true, 'create chat'),
      AttendanceModel('Ahmed', true, 'create APIs'),
      AttendanceModel('Aya', true, 'build profile page'),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.all(16.0),
          child:
          Column(
            children: [
              Row(
                children: [
                  Text("Last Reports",
                      style: TextStyles.blue4D18w700),
                  Spacer(),
                  CustomGeneralButton(text: 'New Report',
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => AddNewReport()));
                      },
                      editwidth: 130,
                      editheight: 40,
                      inverse: true),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) =>
                      reportListWidget(context, reports[index]),
                ),
              )
            ],
          ));
  }
}
