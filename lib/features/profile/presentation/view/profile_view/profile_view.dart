import 'package:capstone/features/profile/presentation/view/profile_view/widgets/profile_view_body.dart';
import 'package:capstone/utils/widgets/background.dart';
import 'package:capstone/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile', context),
      body: Stack(
        children: [
          Background(),
          profileViewBody(context),
        ],
      ),
    );
  }
}