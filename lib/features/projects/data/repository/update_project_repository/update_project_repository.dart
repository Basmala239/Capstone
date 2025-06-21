import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> updateProject({
  required String token,
  required int projectId,
  required String title,
  required String description,
  required String category,
  required String status,
  required int teamId,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/projects/$projectId');

  final response = await http.put(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode({
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'team_id': teamId,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Project updated successfully.');
    print(data);
    return data['status'] == true;
  } else {
    print('Failed to update project: ${response.statusCode}');
    print(response.body);
    return false;
  }
}
