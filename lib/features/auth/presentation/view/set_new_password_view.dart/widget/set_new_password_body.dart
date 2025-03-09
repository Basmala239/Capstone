import 'package:capstone/features/home/presentation/view/home_view.dart';
import 'package:capstone/utils/widgets/custom_buttons.dart';
import 'package:capstone/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class SetNewPasswordBody extends StatelessWidget {
  SetNewPasswordBody({super.key});
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Set The New Password',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),),
            const SizedBox(height: 30,),
            CustomTextField(
              ontap: (){
               // Provider.of<SetNewPassword>(context,listen: false).changeHideNewPassword();
              },
              controller: newPassword, 
              hint: 'New Password',
              isPassword: true,
              // empty: Provider.of<SetNewPassword>(context).isNewPasswordEmpty(),
              // obscureText: Provider.of<SetNewPassword>(context).isShowNewPassword(),
              ),
            const SizedBox(height: 20,),
            CustomTextField(
              ontap: (){
                //Provider.of<SetNewPassword>(context,listen: false).changeHideConfirmPassword();
              },
              controller: confirmPassword, 
              hint: 'Confirm Password',
              isPassword: true,
              // empty: Provider.of<SetNewPassword>(context).isConfirmPasswordEmpty(),
              // obscureText: Provider.of<SetNewPassword>(context).isShowConfirmPassword(),
              // wrong: Provider.of<SetNewPassword>(context).equal(),
              ),
            const SizedBox(height: 20,),
            CustomGeneralButton(text: 'Confirm Password',onTap: (){
                // if(newPassword.text==''){
                //   Provider.of<SetNewPassword>(context,listen: false).reset(-1, 1);
                // }else if(confirmPassword.text==''){
                //   Provider.of<SetNewPassword>(context, listen: false).reset(1, -1);
                // }else if(newPassword.text!=confirmPassword.text){
                //    Provider.of<SetNewPassword>(context, listen: false).reset(1, 0);
                // }else{
                //    Provider.of<SetNewPassword>(context, listen: false).reset(1, 1);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
                // }
            },)
          ],
        ),
      ),
    );
  }
}