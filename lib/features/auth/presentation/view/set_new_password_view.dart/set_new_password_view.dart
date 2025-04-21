import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_back_button.dart';
import 'package:capstone/features/auth/presentation/view/set_new_password_view.dart/widget/set_new_password_body.dart';
import 'package:flutter/material.dart';
class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blueCC,
        leading: backButton(context),
      ),
      body: Stack(
        children:[
          Background(),
          SetNewPasswordBody()
        ]),
    );
  }
}