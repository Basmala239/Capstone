import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDashboardStats(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/stats');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      throw Exception('Unexpected response format.');
    }
  } else {
    throw Exception('Failed to load dashboard stats. Status: ${response.statusCode}');
  }
}
