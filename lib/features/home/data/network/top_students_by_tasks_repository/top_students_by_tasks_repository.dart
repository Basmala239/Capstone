import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchTopStudentsByTasks(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/top-students-by-tasks');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
  );
    print(response.body);
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    if (decoded['status'] == true && decoded['students'] is List) {
      return List<Map<String, dynamic>>.from(decoded['students']);
    } else {
      throw Exception('Invalid or empty data format');
    }
  } else {
    throw Exception('Failed to fetch top students. Status: ${response.statusCode}');
  }
}
