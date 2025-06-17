import 'package:http/http.dart' as http;

Future<bool> deleteUser({
  required String token,
  required int userId,
  required String userType
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/users/$userType/$userId');

  final response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('User deleted successfully.');
    return true;
  } else {
    print('Failed to delete user. Status: ${response.statusCode}');
    print('Response: ${response.body}');
    return false;
  }
}
