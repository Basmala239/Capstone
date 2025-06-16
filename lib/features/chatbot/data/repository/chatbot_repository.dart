import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendChatMessage(String question) async {
  final url = Uri.parse('https://pm-chatbot-production.up.railway.app/chat');

  final response = await http.post(
    url,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'question': question,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Response: ${data['response']}');
    return data['response'];
  } else if (response.statusCode == 422) {
    print('Validation Error: ${response.body}');
    return 'Validation Error: ${response.body}';
  } else {
    print('Error ${response.statusCode}: ${response.body}');
    return 'Error ${response.statusCode}: ${response.body}';
  }
}
