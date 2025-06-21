import 'package:capstone/features/profile/presentation/view/change_password_view/change_password_view.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/widgets/profile_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../edit_profile_view/edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blueCC,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorManager.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Profile',
          style: TextStyles.white24w700,),
        actions: [
          PopupMenuButton(
            color: ColorManager.white,
            itemBuilder: (context)=>[
            PopupMenuItem(
                value: 'Edit Profile',
                child: Text('Edit Profile'),
            ),PopupMenuItem(
                value: 'Change Password',
                child: Text('Change Password'),
            ),
          ],
          onSelected: (String choice){
            if(choice=='Edit Profile'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileView()));
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordView()));
            }
          },)
        ],
      ),
      body: Stack(
        children: [
          Background(),
          profileViewBody(context,Provider.of<UserProvider>(context).user?.userType ?? '',),
        ],
      ),
    );
  }
}