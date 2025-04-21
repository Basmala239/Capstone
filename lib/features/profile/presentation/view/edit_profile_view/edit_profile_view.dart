import 'package:capstone/features/profile/presentation/view/edit_profile_view/widgets/profile_edit_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Edit Profile', context),
      body: Stack(
        children: [
          Background(),
          ProfileEditViewBody(),
        ],
      ),
    );
  }
}