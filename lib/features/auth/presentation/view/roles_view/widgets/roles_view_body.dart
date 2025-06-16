import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/features/auth/data/models/roles_models/role_card_model.dart';
import 'package:capstone/features/auth/presentation/view/roles_view/widgets/role_card.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

class RolesViewBody extends StatelessWidget {
  RolesViewBody({super.key});

  final List <RoleCardModel> roles=[
    RoleCardModel(image: AssetsManager.studentImage, role: 'user'),
    RoleCardModel(image: AssetsManager.staffImage, role: 'supervisor'),
    RoleCardModel(image: AssetsManager.adminImage, role: 'admin')
    ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: EdgeInsets.all(18),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Capstone',
            style: TextStyles.black30W600,),
            ...List.generate(roles.length, 
            (index)=>roleCard(roles[index],index,context)
            ),
          ],
        ),
      ),
    );
  }
}