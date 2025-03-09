import 'package:capstone/utils/widgets/background.dart';
import 'package:capstone/features/auth/presentation/view/login_view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          LoginViewBody(),
        ],
      )
      
    );
  }
}