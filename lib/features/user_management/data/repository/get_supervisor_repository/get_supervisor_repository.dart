import 'dart:convert';
import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:http/http.dart' as http;

Future<Supervisor> getSupervisor(String token, int id) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/users/supervisor/$id');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data['status'] == true && data['user'] != null) {
      return Supervisor.fromJson(data['user']);
    } else {
      throw Exception('API returned error: ${data['msg']}');
    }
  } else {
    throw Exception(
        'Failed to fetch user. Status code: ${response.statusCode}');
  }
}
