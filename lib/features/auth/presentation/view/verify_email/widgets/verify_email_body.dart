import 'package:capstone/features/auth/presentation/view/set_new_password_view.dart/set_new_password_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/custom_text_field.dart';
import '../../../model_view/verify_email/verify_email_provider.dart';

// ignore: must_be_immutable
class VerifyEmailBody extends StatelessWidget {
  VerifyEmailBody({super.key, required this.email, required this.code, required this.type});
  final String email;
  final String code;
  final String type;
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Verify Your Email',
          style: TextStyles.black30W600,),
          Text('We’ll send the code on $email',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: ColorManager.gray4D
          ),
          ),
          CustomTextField(
            controller: codeController,
            hint: 'code',
            errorText: Provider.of<VerifyEmailProvider>(context).isCodeEmpty()
                ? 'Required'
                : (
                Provider.of<VerifyEmailProvider>(context).isCodeWrong()
                    ? 'Wrong code, Try again'
                    : ''),
          ),
          SizedBox(height: 10,),
          CustomGeneralButton(
            text: 'Continue',
            onTap: (){
              if(codeController.text.trim()==''){
                Provider.of<VerifyEmailProvider>(context,listen: false).reset(-1);
              }else if(code==codeController.text.trim()){
                Provider.of<VerifyEmailProvider>(context,listen: false).reset(1);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SetNewPasswordView(email: email,code: code,type: type)));
              }else{
                Provider.of<VerifyEmailProvider>(context,listen: false).reset(0);
              }
            },
          )
        ],
      ),
    );
  }
}