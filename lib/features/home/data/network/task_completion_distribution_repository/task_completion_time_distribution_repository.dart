import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchTaskCompletionDistribution(String token) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/task-completion-time-distribution');

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
    final data = jsonDecode(response.body);
    print('✅ Task Completion Distribution: $data');
    return data;
  } else {
    print('❌ Failed to fetch data: ${response.statusCode}');
    print('Response: ${response.body}');
    return null;
  }
}
