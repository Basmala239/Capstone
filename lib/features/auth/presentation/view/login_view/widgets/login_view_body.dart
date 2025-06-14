import 'dart:convert';

import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:capstone/features/auth/presentation/view/reset_password/reset_password_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../../home/presentation/view/home_view.dart';
import '../../../../data/models/admin_model/admin_model.dart';
import '../../../../data/models/login_response/login_response_model.dart';
import '../../../../data/models/student_model/student_model.dart';
import '../../../model_view/login_provider/Login_provider.dart';
import '../../../model_view/user_provider/user_provider.dart';

class LoginViewBody extends StatefulWidget {
  final String type;
  const LoginViewBody({super.key, required this.type});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  SnackBar snackBar = SnackBar(content: Text(''));
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _login() async {
    const url = 'https://dev.3bhady.com/api/v1/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print(jsonResponse['status']);
      if (jsonResponse['status'] == false) {
        Provider.of<LoginProvider>(context, listen: false).wrongType(jsonResponse['msg']);
        return;
      }
      final loginResponse = LoginResponse.fromJson(jsonResponse);
      if(widget.type!=loginResponse.data.userType){
        Provider.of<LoginProvider>(context, listen: false).wrongType('Not Found');
        return;
      }

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(loginResponse.data.user,loginResponse.data.token);
      final user = loginResponse.data.user;
      if (user is Student|| user is Admin || user is Supervisor) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
      }
    } catch (e) {
      Provider.of<LoginProvider>(context, listen: false).wrongType('An error occurred. Please try again.');
    }
  }
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

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
            CustomTextField(
              controller: _emailController,
              hint: 'Email',
              errorText: Provider
                  .of<LoginProvider>(context)
                  .usernameError ?? "",
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              controller: _passwordController,
              hint: 'Password',
              obscureText: Provider
                  .of<VisibilityProvider>(context)
                  .visible,
              errorText: Provider
                  .of<LoginProvider>(context)
                  .passwordError ?? "",
              isPassword: true,
              onTap: () {
                Provider.of<VisibilityProvider>(context, listen: false)
                    .changeVisibility();
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
                const SizedBox(width: 5,),
                const Text('Remember Me',
                  style: TextStyles.gray18W400,),
                const Spacer(),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ResetPasswordView()));
                }, child: const Text('Forgot Password?',
                  style: TextStyles.gray18W400,))
              ],
            ),
            const SizedBox(height: 20,),
            CustomGeneralButton(
              text: 'Log In',
              onTap: () async {
                Provider.of<LoginProvider>(context, listen: false)
                    .setUsernameOrEmail(_emailController.text);
                Provider.of<LoginProvider>(context, listen: false).setPassword(
                    _passwordController.text);
                if(Provider.of<LoginProvider>(context, listen: false).validateForm()){
                  print("valid");

                  _login();
                }


                //   if (User.currentUser?.userType == widget.type) {
                //     Navigator.pushReplacement(context, MaterialPageRoute(
                //         builder: (context) => HomeView()));
                //   } else {
                //     Provider.of<LoginProvider>(context, listen: false)
                //         .wrongType();
                //   }

              },
            ),
          ],
        ),
      ),
    );
  }
}