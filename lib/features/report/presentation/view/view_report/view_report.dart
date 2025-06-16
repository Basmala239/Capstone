import 'package:capstone/features/report/data/model/report_model.dart';
import 'package:capstone/features/report/presentation/view/view_report/widget/report_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../auth/presentation/model_view/user_provider/user_provider.dart';

class ViewReport extends StatelessWidget {
  final Report report;
  const ViewReport({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Report', context),
      body: Stack(
        children: [
          Background(),
          ViewReportBody(report: report,token: Provider.of<UserProvider>(context, listen: false).token??"")
        ],
      ),
    );
  }
}

