import 'package:capstone/features/user_management/presentation/view/user_view/widget/user_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Add User', context),
      body: Stack(
        children: [
          Background(),
        ],
      ),
    );
  }
}
