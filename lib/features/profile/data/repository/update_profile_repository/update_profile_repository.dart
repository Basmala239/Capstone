import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> updateProfile({
  required String token,
  required String name,
  required String email,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/profile');

  final response = await http.put(
    uri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'student_name': name,
      'email': email,
    }),
  );

  if (response.statusCode == 200) {
    print('✅ Profile updated successfully');
    print(jsonDecode(response.body));
  } else {
    print('❌ Failed to update profile');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
