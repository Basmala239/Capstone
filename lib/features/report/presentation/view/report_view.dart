import 'package:capstone/features/report/presentation/view/widgets/report_body.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/background.dart';
import '../../../../widgets/custom_appbar.dart';
class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Report', context),
      body: Stack(
        children: [
          Background(),
          ReportBody()
        ],
      ),
    );
  }
}
