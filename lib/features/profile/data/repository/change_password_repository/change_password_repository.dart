import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> changePassword({
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

  final Map<String, dynamic> responseBody = jsonDecode(response.body);

  if (response.statusCode == 200) {
    print('✅ Profile updated successfully');
    print(responseBody);
    return responseBody['msg'] ?? 'Profile updated successfully';
  } else {
    print('❌ Failed to update profile');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return responseBody['msg'] ?? 'Failed to update profile';
  }
}
//تم تغيير كلمة المرور بنجاح.