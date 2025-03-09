import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title,BuildContext context){
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    ),
    leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
    title: Text(title,
    style: TextStyles.white24w700,),
  );
}