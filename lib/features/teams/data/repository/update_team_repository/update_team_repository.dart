import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> updateTeam({
  required int teamId,
  required String newDescription,
  required String token,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/teams/$teamId');

  var request = http.MultipartRequest('PUT', uri)
    ..headers['Authorization'] = 'Bearer $token'
    ..fields['description'] = newDescription;

  try {
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      print(data);
      print('Success: ${data['msg']}');
    } else {
      final errorBody = await response.stream.bytesToString();
      print('Error ${response.statusCode}: $errorBody');
    }
  } catch (e) {
    print('Exception occurred: $e');
  }
}
