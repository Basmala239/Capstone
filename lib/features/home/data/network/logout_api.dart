import 'package:http/http.dart' as http;

Future<void> logout(String? token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/logout');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('Logout successful.');
  } else {
    print('Logout failed: ${response.statusCode}');
  }
}
