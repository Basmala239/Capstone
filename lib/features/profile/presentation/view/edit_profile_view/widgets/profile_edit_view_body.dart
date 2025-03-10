import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/utils/widgets/custom_buttons.dart';
import 'package:capstone/utils/widgets/custom_text_field.dart';
import 'package:flutter/widgets.dart';
class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileEditViewBody> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _roleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        CustomTextField(controller: _currentPasswordController, hint: 'Current Password', ontap: (){},color: ColorManager.whiteop,),
        SizedBox(height: 10,),
        CustomTextField(controller: _newPasswordController, hint: 'New Password', ontap: (){},color: ColorManager.whiteop),
        SizedBox(height: 10,),
        CustomTextField(controller: _confirmPasswordController, hint: 'Confirm Password', ontap: (){},color: ColorManager.whiteop),
        SizedBox(height: 10,),
        CustomTextField(controller: _roleController, hint: 'Role', ontap: (){},color: ColorManager.whiteop),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomGeneralButton(text: 'Cancel',onTap: (){},editwidth:130,editheight: 40,inverse: true),
            CustomGeneralButton(text: 'Save',onTap: (){},editwidth:130 ,editheight: 40,),
          ],
        )
      ],
    );
  }
}