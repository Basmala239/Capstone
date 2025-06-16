import 'package:capstone/features/profile/presentation/view/change_password_view/widget/change_password_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Change Password', context),
      body: Stack(
        children: [
          Background(),
          ChangePasswordBody(),
        ],
      ),
    );
  }
}