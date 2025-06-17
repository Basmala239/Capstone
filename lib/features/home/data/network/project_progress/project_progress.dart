import 'dart:convert';
import 'package:http/http.dart' as http;
Future<Map<String, dynamic>> fetchProjectProgress(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/analytical-reports');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['status'] == true && data['analyticalReports'] != null) {
      return Map<String, dynamic>.from(data['analyticalReports']);
    } else {
      throw Exception('Invalid or missing analyticalReports data');
    }
  } else {
    throw Exception('Failed to load project progress. Status: ${response.statusCode}');
  }
}
