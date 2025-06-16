import 'package:capstone/features/user_management/presentation/all_users/view/widget/all_uses_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../model_view/user_cubit.dart';

class UserListView extends StatelessWidget {
  final String token;

  const UserListView({required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
        UserCubit()
          ..fetchUsers(token),
        child: Scaffold(
          appBar: customAppBar('All Users', context),
          body: Stack(
            children: [
              Background(),
              UserListBody(token: token)
            ],
          ),
        )
    );
  }
}