import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_back_button.dart';
import 'package:capstone/features/auth/presentation/view/verify_email/widgets/verify_email_body.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key, required this.email, required this.code, required this.type});
  final String email;
  final String code;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blueCC,
        leading: backButton(context),
      ),
      body:Stack(
        children: [
          Background(),
          VerifyEmailBody(email: email, code: code, type: type),
        ],
      )
       
    );
  }
}