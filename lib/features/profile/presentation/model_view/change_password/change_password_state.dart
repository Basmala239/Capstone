class ChangePasswordState {
  final String? currentPasswordError;
  final String? newPasswordError;
  final String? confirmPasswordError;
  final bool isValid;

  const ChangePasswordState({
    this.currentPasswordError,
    this.newPasswordError,
    this.confirmPasswordError,
    this.isValid = false,
  });

  ChangePasswordState copyWith({
    String? currentPasswordError,
    String? newPasswordError,
    String? confirmPasswordError,
    bool? isValid,
  }) {
    return ChangePasswordState(
      currentPasswordError: currentPasswordError ?? this.currentPasswordError,
      newPasswordError: newPasswordError ?? this.newPasswordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      isValid: isValid ?? this.isValid,
    );
  }
}
