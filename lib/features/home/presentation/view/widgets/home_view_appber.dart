import 'package:capstone/features/notification/presentation/view/notification_view.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    title: Text('Capstone'),
    actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
      }, icon:Icon(Icons.notifications_none)),
      IconButton(onPressed: (){
        showMenu(context: context, items: [
          PopupMenuItem(child: Text('Profile')),
          PopupMenuItem(child: Text('report')),
          PopupMenuItem(child: Text('Logout')),
        ]);
      }, icon:Icon(Icons.density_medium_rounded)),
    ],
  );
}