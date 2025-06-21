import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../notification/presentation/view/notification_view.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    iconTheme: IconThemeData(color: ColorManager.white),
    backgroundColor: ColorManager.blueCC,
    title: Text('Capstone',
    style: TextStyles.white24w700,),
    actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView(token: Provider.of<UserProvider>(context,listen: false).token??'',)));
      }, icon:Icon(Icons.notifications_none,)),
      SizedBox(width: 5,)
    ],
  );
}