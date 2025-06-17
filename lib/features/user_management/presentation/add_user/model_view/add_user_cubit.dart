import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserState());

  void updateField(String field, String value) {
    emit(state.copyWith(updatedFields: {field: value}));
  }

  void updateRole(String? role) {
    emit(state.copyWith(role: role));
  }

  void validateForm() {
    final errors = <String, String?>{};

    if (state.name.trim().isEmpty) errors['name'] = 'Required';
    if (state.email.trim().isEmpty) errors['email'] = 'Required';
    if (state.password.length < 8) errors['password'] = 'At least 8 characters';

    emit(state.copyWith(errors: errors));
  }

  void clearForm() {
    emit(AddUserState());
  }
}
