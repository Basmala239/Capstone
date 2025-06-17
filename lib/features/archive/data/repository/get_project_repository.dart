import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/project_model.dart';
Future<Project?> getProject(String token, int id) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/projects/$id');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['status'] == true && data['project'] != null) {
      final project = Project.fromJson(data['project']);
      print('✅ Project title: ${project.title}');
      return project;
    } else {
      print('❌ Error: ${data['msg']}');
      return null;
    }
  } else {
    print('❌ Failed with status code: ${response.statusCode}');
    return null;
  }
}
