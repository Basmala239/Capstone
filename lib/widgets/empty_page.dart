import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

Widget emptyPage(String title){
  return Center(
    child: Text('No $title',
    style: TextStyles.white24w600,),

  );
}