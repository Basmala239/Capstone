import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDashboardReports(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/reports');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'status': 'To-Do & In Progress & Pending & Done',
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      throw Exception('Unexpected response format.');
    }
  } else {
    throw Exception('Failed to fetch dashboard reports. Status: ${response.statusCode}');
  }
}
