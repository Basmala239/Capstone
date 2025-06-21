import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> updateProfileAdmin({
  required String token,
  required String name,
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
      'name': name,
    }),
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
