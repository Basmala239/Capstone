import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _usernameOrEmail = '';
  String _password = '';

  String? _usernameError;
  String? _passwordError;

  String get usernameOrEmail => _usernameOrEmail;
  String get password => _password;
  String? get usernameError => _usernameError;
  String? get passwordError => _passwordError;

  void setUsernameOrEmail(String value) {
    _usernameOrEmail = value.trim();
    _usernameError = _validateUsernameOrEmail(_usernameOrEmail);
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = _validatePassword(_password);
    notifyListeners();
  }

  // Validation logic
  String? _validateUsernameOrEmail(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,}$');

    if (!emailRegex.hasMatch(value) && !usernameRegex.hasMatch(value)) {
      return 'Enter a valid email or username';
    }

    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  // Final check before login
  bool validateForm() {
    _usernameError = _validateUsernameOrEmail(_usernameOrEmail);
    _passwordError = _validatePassword(_password);
    notifyListeners();
    return _usernameError == null && _passwordError == null;
  }

  void wrongType(String error){
    _usernameError=error;
    notifyListeners();
  }

  void reset() {
    _usernameOrEmail = '';
    _password = '';
    _usernameError = null;
    _passwordError = null;
    notifyListeners();
  }
}

class VisibilityProvider with ChangeNotifier {
  bool _visible=true;
  bool get visible => _visible;

  void changeVisibility() {
    _visible = !_visible;
    notifyListeners();
  }
}
