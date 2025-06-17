import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../auth/data/models/app_user/app_user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> fetchUsers(String token) async {
    emit(UserLoading());
    try {
      final res = await http.get(
        Uri.parse('https://dev.3bhady.com/api/v1/users'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final body = jsonDecode(res.body);
      print('users : {$body}');
      final List<AppUser> users = (body['users'] as List)
          .map((e) => AppUser.fromJson(e))
          .toList();

      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
