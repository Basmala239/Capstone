import 'package:flutter/material.dart';

import '../../../../../resources/text_styles.dart';
Widget dashboardCard({
  required IconData icon,
  int? progress,
  bool? pre,
  required String title,
}) {
  return Container(
    width: 150,
    height: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
    ),
    padding: EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon ,color: Colors.blue,size: 30,),
        Text(
          pre == true ? '${progress ?? 0}%' : '${progress ?? 0}',
          style: TextStyles.black18W400,),
        Text(title,textAlign: TextAlign.center),
      ],
    ),
  );
}
