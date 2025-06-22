import 'dart:convert';
import 'package:capstone/features/auth/data/models/admin_model/admin_model.dart';
import 'package:capstone/features/auth/data/models/student_model/student_model.dart';
import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:capstone/features/auth/presentation/model_view/admin_user_provider/admin_user_provider.dart';
import 'package:capstone/features/auth/presentation/model_view/student_user_provider/student_user_provider.dart';
import 'package:capstone/features/auth/presentation/model_view/supervisor_user_provider/supervisor_user_provider.dart';
import 'package:capstone/features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'package:capstone/features/auth/presentation/view/reset_password/reset_password_view.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../../home/presentation/view/home_view.dart';
import '../../../../../profile/data/repository/get_profile_repository/profile_repository.dart';
import '../../../../data/models/login_response/login_response_model.dart';
import '../../../model_view/login_provider/login_provider.dart';

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

      if (jsonResponse['status'] == false) {
        Provider.of<LoginProvider>(context, listen: false).wrongType(jsonResponse['msg']);
        return;
      }

      final loginResponse = LoginResponse.fromJson(jsonResponse);
      final userData = loginResponse.userData;
      final user = userData.user;

      if (widget.type != user.userType) {
        Provider.of<LoginProvider>(context, listen: false).wrongType('Not Found');
        return;
      }
      if( user.userType == 'student'){
        Provider.of<StudentUserProvider>(context,listen: false).setStudent((await getProfile(userData.accessToken)) as Student, userData.accessToken);
        Provider.of<UserProvider>(context,listen: false).setUser((Provider.of<StudentUserProvider>(context,listen: false).user) as Student, userData.accessToken);
      }
      if( user.userType == 'admin'){
        Provider.of< AdminUserProvider>(context,listen: false).setAdmin((await getProfile(userData.accessToken)) as Admin, userData.accessToken);
        Provider.of<UserProvider>(context,listen: false).setUser((Provider.of<AdminUserProvider>(context,listen: false).user) as Admin, userData.accessToken);
      }
      if( user.userType == 'supervisor'){
        Provider.of<SupervisorUserProvider>(context,listen: false).setSupervisor((await getProfile(userData.accessToken)) as Supervisor, userData.accessToken);
        Provider.of<UserProvider>(context,listen: false).setUser((Provider.of<SupervisorUserProvider>(context,listen: false).user) as Supervisor, userData.accessToken);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
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
                const Spacer(),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ResetPasswordView(type: widget.type)));
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
                  _login();
                }


              },
            ),
          ],
        ),
      ),
    );
  }
}