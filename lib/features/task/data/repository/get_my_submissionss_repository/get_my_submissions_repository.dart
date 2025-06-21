import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/task_submission.dart';

Future<List<TaskSubmission>> getMySubmissions({required String token}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/my-submissions');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    final List submissionsJson = data['submissions'] ?? [];
    return submissionsJson
        .map((json) => TaskSubmission.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load submissions. Code: ${response.statusCode}');
  }
}


//{status: false, errNum: 0, msg: Call to undefined method App\Models\User::taskSubmissions()}