import 'package:http/http.dart' as http;

Future<void> sendPasswordResetLink(String email) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/forgot-password');

  final request = http.MultipartRequest('POST', url)
    ..headers.addAll({
      'Accept': 'application/json',
    })
    ..fields['email'] = email;


  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  print(response.body);

  if (response.statusCode == 200) {
    print('Password reset link sent successfully.');
  } else {
    print('Failed to send reset link: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
