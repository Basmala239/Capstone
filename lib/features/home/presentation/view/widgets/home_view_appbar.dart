import 'package:capstone/features/notification/presentation/view/notification_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    iconTheme: IconThemeData(color: ColorManager.white),
    backgroundColor: ColorManager.blueCC,
    title: Text('Capstone',
    style: TextStyles.white24w700,),
    actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
      }, icon:Icon(Icons.notifications_none,)),
      SizedBox(width: 5,)
    ],
  );
}