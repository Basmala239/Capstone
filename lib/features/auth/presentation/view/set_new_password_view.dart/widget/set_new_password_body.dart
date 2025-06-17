import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/repos/set_new_password_repo/set_new_password_repository.dart';
import '../../../model_view/set_new_password_provider/set_new_password_provider.dart';
import '../../login_view/login_view.dart';
class SetNewPasswordBody extends StatelessWidget {
  SetNewPasswordBody({super.key, required this.email, required this.code, required this.type});

  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final String email;
  final String code;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Set The New Password',
              style: TextStyles.black30W600,),
            const SizedBox(height: 30,),
            CustomTextField(
              onTap: () {
                Provider.of<SetNewPassword>(context, listen: false)
                    .changeHideNewPassword();
              },
              controller: newPassword,
              hint: 'New Password',
              isPassword: true,
              errorText: Provider.of<SetNewPassword>(context)
                  .isNewPasswordEmpty() ? 'Required' : '',
              obscureText: Provider.of<SetNewPassword>(context)
                  .isShowNewPassword(),
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              onTap: () {
                Provider.of<SetNewPassword>(context, listen: false)
                    .changeHideConfirmPassword();
              },
              controller: confirmPassword,
              hint: 'Confirm Password',
              isPassword: true,
              errorText: Provider.of<SetNewPassword>(context)
                  .isConfirmPasswordEmpty() ? 'Required' : (
                  Provider.of<SetNewPassword>(context).equal()
                      ? ''
                      : 'Not The Same'),
              obscureText: Provider.of<SetNewPassword>(context)
                  .isShowConfirmPassword(),
            ),
            const SizedBox(height: 20,),
            CustomGeneralButton(text: 'Confirm Password', onTap: () async {
              if (newPassword.text.trim() == '') {
                Provider.of<SetNewPassword>(context, listen: false).reset(
                    -1, 1);
              } else if (confirmPassword.text.trim() == '') {
                Provider.of<SetNewPassword>(context, listen: false).reset(
                    1, -1);
              } else
              if (newPassword.text.trim() != confirmPassword.text.trim()) {
                Provider.of<SetNewPassword>(context, listen: false).reset(0, 0);
              } else {
                Provider.of<SetNewPassword>(context, listen: false).reset(1, 1);
                 if(await resetPassword(
                  email: email,
                  code: code,
                  password: newPassword.text.trim(),
                  passwordConfirmation: confirmPassword.text.trim(),
                )) {
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context) => LoginView(type: type,)));
                 }else{
                   print('not forget snake bar');
                 }
              }
            },)
          ],
        ),
      ),
    );
  }
}