import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> createProjectRequest({
  required String token,
  required String title,
  required String description,
  required int teamId,
  required int suggestedByUserId,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/project-requests');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'title': title,
      'description': description,
      'team_id': teamId,
      'suggested_by_user_id': suggestedByUserId,  // the actual logged-in user ID
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = jsonDecode(response.body);
    print(data);
    return data['status'] == true;
  } else {
    print('Error creating request: ${response.statusCode}');
    print(response.body);
    return false;
  }
}
