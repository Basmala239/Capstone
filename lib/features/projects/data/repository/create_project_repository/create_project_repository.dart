import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> createProject({
  required String token,
  required String title,
  required String description,
  required String category,
  required String status,
  required int teamId,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/projects');

  final request = http.MultipartRequest('POST', uri)
    ..headers['Authorization'] = 'Bearer $token'
    ..fields['title'] = title
    ..fields['description'] = description
    ..fields['category'] = category
    ..fields['status'] = status
    ..fields['team_id'] = teamId.toString();

  final response = await request.send();

  if (response.statusCode == 200 || response.statusCode == 201) {
    final responseBody = await response.stream.bytesToString();
    final data = jsonDecode(responseBody);
    print (data);
    return data['status'] == true;
  } else {
    print('Failed to create project. Status code: ${response.statusCode}');
    final errorBody = await response.stream.bytesToString();
    print('Error body: $errorBody');
    return false;
  }
}
