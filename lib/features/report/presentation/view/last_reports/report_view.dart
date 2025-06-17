import 'package:capstone/features/report/presentation/view/add_new_report/add_new_report_view.dart';
import 'package:capstone/features/report/presentation/view/last_reports/widget/report_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/background.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../resources/color_manager.dart';
class ReportView extends StatelessWidget {
  final String token;
  const ReportView({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Report', context),
      body: Stack(
        children: [
          Background(),
          LastReportBody(token: token)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.blueCC,
        onPressed: (){
          //createUser(token);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewReport()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




