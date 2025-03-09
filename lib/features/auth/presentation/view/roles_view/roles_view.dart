import 'package:capstone/utils/widgets/background.dart';
import 'package:capstone/features/auth/presentation/view/roles_view/widgets/roles_view_body.dart';
import 'package:flutter/material.dart';

class RolesView extends StatelessWidget {
  const RolesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(),
        RolesViewBody()
      ]),
    );
  }
}