import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/features/auth/data/models/roles_models/role_card_model.dart';
import 'package:capstone/features/auth/presentation/view/login_view/login_view.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';
Widget roleCard(RoleCardModel role, int index, BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginView(type: role.role,)));
    },
    child: Container(
      width: 250,
      height: 250,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: index%2==0? ColorManager.blueFF:ColorManager.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(offset: Offset(4, 4),blurRadius: 10,spreadRadius:-4)
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(role.image),
          Text(role.role, style: index%2==0? TextStyles.white24w600:TextStyles.black24w600,)
        ],
      ),
    ),
  );
}