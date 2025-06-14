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
