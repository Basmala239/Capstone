import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        );
}