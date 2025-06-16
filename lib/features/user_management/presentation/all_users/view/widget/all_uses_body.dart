import 'package:capstone/features/user_management/presentation/all_users/view/widget/view_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../resources/color_manager.dart';
import '../../model_view/user_cubit.dart';
import '../../model_view/user_state.dart';

class UserListBody extends StatelessWidget {
  final String token;

  const UserListBody({required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return userCard(user);
            },
          );
        } else if (state is UserError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        return Center(child: Text("Press to load users"));
      },
    );
  }
}
