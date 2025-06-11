import 'package:capstone/features/auth/presentation/view/reset_password/reset_password_view.dart';
import 'package:capstone/features/home/student_home/presentation/view/home_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Log in',
            style: TextStyles.black30W600,),
            const SizedBox(height: 30,),
            CustomTextField(controller: _emailController,
              hint: 'Email',
              ontap: (){}),
            const SizedBox(height: 15,),  
            CustomTextField(
              controller: _passwordController, 
              hint: 'Password',
              isPassword: true,
              ontap: (){
                },),
            const SizedBox(height: 20,),
              Row(
                  children: [
                    Checkbox(
                      checkColor: ColorManager.gray4D,
                      activeColor: ColorManager.white,
                      value: false,
                      onChanged: (bool? value) {
                       
                      },
                    ),
                    const SizedBox(width:5,),
                    const Text('Remember Me',
                    style: TextStyles.gray18W400,),
                    const Spacer(),
                    TextButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordView()));

                    }, child: const Text('Forgot Password?',
                    style: TextStyles.gray18W400,))
                  ],
                ),
                const SizedBox(height: 20,),
              CustomGeneralButton(
                text: 'Log In',
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
                },
              ),
          ],
        ),
      ),
    );
  }
}