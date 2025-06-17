import 'package:capstone/features/user_management/presentation/add_user/view/widget/add_user_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../model_view/add_user_cubit.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Add User', context),
        body: Stack(
          children: [
            Background(),
            BlocProvider(
              create: (_) => AddUserCubit(),
              child: AddUserBody(token: token,),
            )
          ],
        ));
  }
}
