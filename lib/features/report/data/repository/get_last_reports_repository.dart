import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getLastReports(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/reports');

  final response = await http.get(
    url,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('✅ Last Reports Received:');
    print(data);
  } else {
    print('❌ Failed to get reports');
    print('Status Code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
