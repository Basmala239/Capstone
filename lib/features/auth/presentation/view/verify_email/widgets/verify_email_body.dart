import 'package:capstone/features/auth/presentation/view/set_new_password_view.dart/set_new_password_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/utils/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerifyEmailBody extends StatelessWidget {
  VerifyEmailBody({super.key, required this.email});
  final String email;
  int code=1234;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Verify Your Email',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24
          ),),
          Text('We’ll send the code on $email',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: ColorManager.gray4D
          ),
          ),
          TextButton(onPressed: (){}, 
          child: const Text('Send Me a New Code',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13
          ),)),
          CustomGeneralButton(
            text: 'Continue',
            onTap: (){
              if(code==1234){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SetNewPasswordView()));
                
              }else{
      
              }
            },
          )
        ],
      ),
    );
  }
}