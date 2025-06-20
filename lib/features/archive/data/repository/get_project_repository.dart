import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/project_model.dart';

class ApiService {
  static const String _baseUrl = 'https://acad-manager-production.up.railway.app/v1/archive';

  static Future<List<Project>> fetchProjects() async {
    final uri = Uri.parse(_baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}