import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchDashboardMembers(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/members');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );
    print(response.body);
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    if (decoded['status'] == true && decoded['members'] is List) {
      return List<Map<String, dynamic>>.from(decoded['members']);
    } else {
      throw Exception('Invalid or empty members data.');
    }
  } else {
    throw Exception('Failed to fetch members. Status: ${response.statusCode}');
  }
}
