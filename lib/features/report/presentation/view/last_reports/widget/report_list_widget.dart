// import 'package:capstone/features/report/data/report_model.dart';
// import 'package:capstone/features/report/presentation/view/widgets/report_view_widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../resources/color_manager.dart';
// import '../../../../../resources/text_styles.dart';
//
// Widget reportListWidget(BuildContext context, ReportModel report){
//   return Container(
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         color:ColorManager.blueEo,
//         borderRadius: BorderRadius.circular(10)
//       ),
//     child: ListTile(
//       trailing: Icon(Icons.arrow_drop_down_circle_outlined,color: ColorManager.white ,),
//       title: Text(report.title,
//           style:TextStyles.black18W400),
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => ReportWidget(report: report)));
//       }
//   ));
// }