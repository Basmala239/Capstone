import 'package:capstone/features/auth/data/models/student_model/student_model.dart';
import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:capstone/features/auth/presentation/model_view/student_user_provider/student_user_provider.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/widgets/data_widget.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/presentation/model_view/admin_user_provider/admin_user_provider.dart';
import '../../../../../auth/presentation/model_view/supervisor_user_provider/supervisor_user_provider.dart';

Widget profileViewBody(BuildContext context, String userType) {
  late final userProvider;
  if(userType =='student') {
    userProvider = Provider.of<StudentUserProvider>(context);
  }else if(userType=='admin'){
    userProvider = Provider.of<AdminUserProvider>(context);
  }else {
    userProvider = Provider.of<SupervisorUserProvider>(context);
  }
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
                  Text(userProvider.user?.name ?? 'User Name',
                  style: TextStyles.gray18W400,),
                  dataWidget('ID', userProvider.user?.id.toString() ??  'ID'),
                  dataWidget('Name', userProvider.getUserName() ?? 'User Name'),
                  dataWidget('Email', userProvider.user?.email ??  'Email'),
                  dataWidget('Type',userProvider.user?.userType ?? 'Role'),
                  if(userProvider.user is Student || userProvider.user is Supervisor)
                  dataWidget('Department', userProvider.user?.department ),
                  if(userProvider.user is Student)
                  dataWidget('Github', userProvider.getGitHub()?? 'Not Found'),
                  if(userProvider.user is Student)
                  dataWidget('TeamID', userProvider.user?.teamId.toString() ?? 'Not Found'),
                  if(userProvider.user is Supervisor)
                  dataWidget('Max Teams Allowed', userProvider.getMaxTeamsAllowed().toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
