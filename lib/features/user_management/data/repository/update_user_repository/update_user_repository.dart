import 'package:http/http.dart' as http;

Future<bool> updateUser({
  required String token,
  required int userId,
  required String userType,
  required String name,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/users/$userType/$userId');

  var request = http.MultipartRequest('PUT', uri)
    ..headers['Authorization'] = 'Bearer $token'
    ..headers['Accept'] = 'application/json'
    ..fields['name'] = name;

  final response = await request.send();
  final responseBody = await response.stream.bytesToString();
  if (response.statusCode == 200) {
    print('✅ User updated successfully: $responseBody');
    return true;
  } else {
    print('❌ Failed to update user. Status: ${response.statusCode}');
    print('Response: $responseBody');
    return false;
  }
}
