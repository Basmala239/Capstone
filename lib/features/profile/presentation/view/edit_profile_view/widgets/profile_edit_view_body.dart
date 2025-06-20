import 'package:capstone/features/auth/presentation/model_view/admin_user_provider/admin_user_provider.dart';
import 'package:capstone/features/auth/presentation/model_view/student_user_provider/student_user_provider.dart';
import 'package:capstone/features/auth/presentation/model_view/supervisor_user_provider/supervisor_user_provider.dart';
import 'package:capstone/features/profile/data/repository/update_profile_repository/update_supervisor_profile_repository.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../data/repository/update_profile_repository/update_admin_profile_repository.dart';
import '../../../../data/repository/update_profile_repository/update_student_profile_repository.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key, required this.userType});
  final String userType;



  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  late TextEditingController nameController;
  late TextEditingController githubController;
  late TextEditingController maxTeamAllowedController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    githubController.dispose();
    maxTeamAllowedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userType == 'student') {
      nameController = TextEditingController(
          text: Provider.of<StudentUserProvider>(context).getUserName() ??
              'User Name');
      maxTeamAllowedController = TextEditingController();
      githubController = TextEditingController(
          text: Provider.of<StudentUserProvider>(context).getGitHub() ??
              'Not found');
    } else if (widget.userType == 'admin') {
      githubController = TextEditingController();
      maxTeamAllowedController = TextEditingController();
      nameController = TextEditingController(
          text: Provider.of<AdminUserProvider>(context).getUserName() ??
              'User Name');
    } else {
      nameController = TextEditingController(
          text: Provider.of<SupervisorUserProvider>(context).getUserName() ??
              'User Name');
      githubController = TextEditingController();
      maxTeamAllowedController = TextEditingController(
          text: Provider.of<SupervisorUserProvider>(context)
              .getMaxTeamsAllowed()
              .toString());
    }
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextField(controller: nameController,
            hint: 'Name',
            color: ColorManager.whiteop),
        if(widget.userType == 'student')
          CustomTextField(controller: githubController,
              hint: 'GitHub',
              color: ColorManager.whiteop),
        if(widget.userType == 'supervisor')
          CustomTextField(controller: maxTeamAllowedController,
              hint: 'Max Team Allowed',
              color: ColorManager.whiteop),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomGeneralButton(
              text: 'Cancel',
              onTap: () {
                Navigator.pop(context);
              },
              editwidth: 130,
              editheight: 40,
              inverse: true,
            ),
            CustomGeneralButton(
              text: 'Save',
              onTap: () async {
                String res = '';
                if (widget.userType == 'student') {
                  res = await updateProfileStudent(
                      token: Provider
                          .of<UserProvider>(context, listen: false)
                          .token ?? '',
                      name: nameController.text.trim(),
                      github: githubController.text.trim()
                  );
                  if (res == 'تم تحديث الملف الشخصي بنجاح.') {
                    Provider.of<StudentUserProvider>(context, listen: false)
                        .changeUserGitHub(githubController.text.trim());
                    Provider.of<StudentUserProvider>(context, listen: false)
                        .changeUserName(nameController.text.trim());
                  }
                } else if (widget.userType == 'admin') {
                  res = await updateProfileAdmin(
                    token: Provider
                        .of<UserProvider>(context, listen: false)
                        .token ?? '',
                    name: nameController.text.trim(),
                  );
                  if (res == 'تم تحديث الملف الشخصي بنجاح.') {
                    Provider.of<AdminUserProvider>(context, listen: false)
                        .changeUserName(nameController.text.trim());
                  }
                } else {
                  res = await updateProfileSupervisor(
                    token: Provider
                        .of<UserProvider>(context, listen: false)
                        .token ?? '',
                    name: nameController.text.trim(),
                    maxTeamsAllowed: maxTeamAllowedController.text.trim(),
                  );
                  if (res == 'تم تحديث الملف الشخصي بنجاح.') {
                    Provider.of<SupervisorUserProvider>(context, listen: false)
                        .changeUserName(nameController.text.trim());
                    Provider.of<SupervisorUserProvider>(context, listen: false)
                        .changeMaxTeamsAllowed(int.parse(maxTeamAllowedController.text.trim()));
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(res),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pop(context);
              },

              editwidth: 130,
              editheight: 40,
            ),
          ],
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

