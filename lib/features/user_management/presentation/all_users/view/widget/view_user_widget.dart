import 'package:flutter/material.dart';

import '../../../../../../resources/color_manager.dart';
import '../../../../../auth/data/models/app_user/app_user_model.dart';

Widget userCard(AppUser user){
  return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4)
        ],

      ),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(user.name ?? 'userName'),
        subtitle: Text("${user.email} • ${user.userType}"),
        //trailing: Text(user.department?? "department"),
      ));
}