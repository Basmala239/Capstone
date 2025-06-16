import 'package:capstone/features/profile/presentation/view/profile_view/profile_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../data/repository/update_profile_repository/update_profile_repository.dart';
class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    nameController = TextEditingController(text: userProvider.user?.name ?? 'User Name');
    emailController = TextEditingController(text: userProvider.user?.email ?? 'Email');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextField(controller: nameController, hint: 'Name', color: ColorManager.whiteop),
        const SizedBox(height: 10),
        CustomTextField(controller: emailController, hint: 'Email', color: ColorManager.whiteop),
        const SizedBox(height: 10),
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
                await updateProfile(
                  token: Provider.of<UserProvider>(context, listen: false).token ?? '',
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                );
              },
              editwidth: 130,
              editheight: 40,
            ),
          ],
        )
      ],
    );
  }
}
