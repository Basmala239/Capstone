import 'package:capstone/features/profile/presentation/view/edit_profile_view/edit_profile_view.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/widgets/data_widget.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/presentation/model_view/user_provider/user_provider.dart';

Widget profileViewBody(BuildContext context) {
    return Center(
      child: Stack(
        children: [
            Column(
              children: [
                SizedBox(height: 140,),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border(top: BorderSide(color: ColorManager.blue4D)),
                     
                  ),
                ),
              ],
            ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  ClipOval(
                    child:Image.asset(AssetsManager.defaultProfileImage,width: 100,height: 100,fit: BoxFit.fill,),
                  ),
                  Text(Provider.of<UserProvider>(context).user?.name ?? 'User Name',
                  style: TextStyles.gray18W400,),
                  dataWidget('Name', Provider.of<UserProvider>(context).user?.name ?? 'User Name'),
                  dataWidget('Email', Provider.of<UserProvider>(context).user?.email ??  'Email'),
                  dataWidget('ID', Provider.of<UserProvider>(context).user?.id.toString() ??  'ID'),
                  dataWidget('Role',Provider.of<UserProvider>(context).user?.userType ?? 'Role'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
