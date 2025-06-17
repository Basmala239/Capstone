import 'package:capstone/features/report/presentation/view/add_new_report/widget/add_new_report_body.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';

class AddNewReport extends StatelessWidget {
  const AddNewReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Create Report', context),
      body: Stack(
        children: [
          Background(),
          AddNewReportBody()
        ],
      ),
    );
  }
}
