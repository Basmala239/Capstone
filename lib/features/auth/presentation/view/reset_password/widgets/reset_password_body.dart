import 'dart:convert';

import 'package:capstone/features/auth/presentation/view/verify_email/verify_email.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../../notification/service/notification_service.dart';
import '../../../../data/models/code_model/code_model.dart';
import '../../../../data/repos/reset_passord_repo/reset_password_repository.dart';
import '../../../model_view/reset_password_provider/reset_password_provider.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key, required this.type});
  final String type;

  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text('Reset Password',
              style: TextStyles.black30W600,),
            const SizedBox(height: 20,),
            const Text(
              'Please enter your email address to for us to send you the link to reset your password on.',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.gray4D
              ),),
            const SizedBox(height: 30,),
            CustomTextField(
              controller: email,
              hint: 'Email',
              errorText: Provider.of<ResetPassword>(context).isEmailEmpty()
                  ? 'Required'
                  : (
                  Provider.of<ResetPassword>(context).isEmailWrong()
                      ? 'Not Found'
                      : ''),
            ),
            const SizedBox(height: 30,),
            CustomGeneralButton(
              text: 'Send Verification',
              onTap: () async {
                if (email.text == '') {
                  Provider.of<ResetPassword>(context, listen: false).reset(-1);
                } else {
                  final http.Response response = await sendPasswordResetLink(
                      email.text);
                  if (response.statusCode == 200) {
                    final codeResponse = CodeResponse.fromJson(json.decode(response.body));
                    Provider.of<ResetPassword>(context, listen: false).reset(1);
                    NotificationService().showNotification(
                      title: "Email verification",
                      body: "Code: ${codeResponse.data.code}",
                    );
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            VerifyEmailView(email: email.text, code:codeResponse.data.code, type:type)));
                  } else {
                    Provider.of<ResetPassword>(context, listen: false).reset(0);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}