import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginService {
  static const _loginUrl = 'https://dev.3bhady.com/api/v1/login';

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}