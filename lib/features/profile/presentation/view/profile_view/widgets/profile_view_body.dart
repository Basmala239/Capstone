import 'package:capstone/features/profile/presentation/view/edit_profile_view/edit_profile_view.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/widgets/data_widget.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/material.dart';

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
                   GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileView()));
                    },
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Edited ',style: TextStyles.black20W500,),
                        Icon(Icons.edit, color: ColorManager.black,)
                      ],
                    ),
                   ),
                  SizedBox(height: 25,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:Image.asset(AssetsManager.studentProfileImage),
                  ),
                  Text('Mohamed Ahmed',
                  style: TextStyles.gray18W400,),
                  dataWidget('Name', 'Mohamed Ahmed'),
                  dataWidget('Email', 'Mohamed Ahmed'),
                  dataWidget('ID', 'Mohamed Ahmed'),
                  dataWidget('Role', 'Mohamed Ahmed'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
