import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  void validateFields({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    String? currentError;
    String? newError;
    String? confirmError;
    bool isValid = true;

    if (currentPassword.isEmpty) {
      currentError = 'Required';
      isValid = false;
    } else if (currentPassword.length < 8) {
      currentError = 'At least 8 characters';
      isValid = false;
    }

    if (newPassword.isEmpty) {
      newError = 'Required';
      isValid = false;
    } else if (newPassword.length < 8) {
      newError = 'At least 8 characters';
      isValid = false;
    }

    if (confirmPassword.isEmpty) {
      confirmError = 'Required';
      isValid = false;
    } else if (confirmPassword != newPassword) {
      confirmError = 'Passwords do not match';
      isValid = false;
    }

    emit(ChangePasswordState(
      currentPasswordError: currentError,
      newPasswordError: newError,
      confirmPasswordError: confirmError,
      isValid: isValid,
    ));
  }
}
