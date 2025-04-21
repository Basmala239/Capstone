import 'package:capstone/features/notification/presentation/view/notification_view.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/profile_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    backgroundColor: ColorManager.blueCC,
    title: Text('Capstone',
    style: TextStyles.white24w700,),
    actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
      }, icon:Icon(Icons.notifications_none,color: ColorManager.white,)),
      
        PopupMenuButton(
          color: ColorManager.white,
          itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
          },child: Text('Profile'))),
          PopupMenuItem(child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
          },child: Text('Log out'))),

          ],
        ),
    ],
  );
}