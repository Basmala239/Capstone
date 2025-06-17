import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../auth/data/models/admin_model/admin_model.dart';

Future<Admin> getAdmin(String token, int id) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/users/admin/$id');

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
      return Admin.fromJson(data['user']);
    } else {
      throw Exception('API returned error: ${data['msg']}');
    }
  } else {
    throw Exception(
        'Failed to fetch user. Status code: ${response.statusCode}');
  }
}
