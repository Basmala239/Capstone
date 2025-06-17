import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchDashboardTasks(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/tasks');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
  );

  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    if (jsonBody['status'] == true && jsonBody['tasks'] is List) {
      return List<Map<String, dynamic>>.from(jsonBody['tasks']);
    } else {
      throw Exception('No tasks found or unexpected format.');
    }
  } else {
    throw Exception('Failed to fetch tasks. Status: ${response.statusCode}');
  }
}
