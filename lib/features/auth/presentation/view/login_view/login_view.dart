import 'package:capstone/widgets/background.dart';
import 'package:capstone/features/auth/presentation/view/login_view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          LoginViewBody(type: type,),
        ],
      )
      
    );
  }
}