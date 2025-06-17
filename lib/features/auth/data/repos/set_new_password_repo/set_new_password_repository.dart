import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> resetPassword({
  required String email,
  required String code,
  required String password,
  required String passwordConfirmation,
}) async {
  final url = Uri.parse("https://dev.3bhady.com/api/v1/reset-password");

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode({
      "email": email,
      "code": code,
      "password": password,
      "password_confirmation": passwordConfirmation,
    }),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }

}
