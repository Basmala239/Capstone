import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title,BuildContext context){
  return AppBar(
    backgroundColor: ColorManager.blueCC,
    leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorManager.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
    title: Text(title,
    style: TextStyles.white24w700,),
  );
}