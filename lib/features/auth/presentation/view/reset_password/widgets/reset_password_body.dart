import 'package:capstone/features/auth/presentation/view/verify_email/verify_email.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/utils/widgets/custom_buttons.dart';
import 'package:capstone/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});
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
            const Text('Please enter your email address to for us to send you the link to reset your password on.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: ColorManager.gray4D
            ),),
            const SizedBox(height: 30,),
            CustomTextField(
              ontap: (){
                
              },
              controller: email, 
              hint: 'Email',
              // empty: Provider.of<ResetPassword>(context).isEmailEmpty(),
              // wrong: Provider.of<ResetPassword>(context).isEmailWrong(),
            ),
            const SizedBox(height: 30,),
            CustomGeneralButton(
              text: 'Send Verification',
              onTap: (){
                if(email.text==''){
                  //Provider.of<ResetPassword>(context,listen: false).reset(-1);
                }else if(email.text!='Basmala'){
                  //Provider.of<ResetPassword>(context,listen: false).reset(0);

                }else{
                  // Provider.of<ResetPassword>(context,listen: false).reset(1);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmailView(email: email.text,)));
                }
              },
              )
          ],
        ),
      ),
    );
  }
}