import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> changePassword({
  required String token,
  required String currentPassword,
  required String newPassword,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/change-password');

  final response = await http.post(
    url,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPassword, // Must match
    },
  );

  if (response.statusCode == 200) {
    print('✅ Password changed successfully');
    print(jsonDecode(response.body));
    return true;
  } else {
    print('❌ Failed to change password');
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
    return false;
  }
}
