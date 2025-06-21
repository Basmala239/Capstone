import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/single_project.dart';

Future<Project?> getOneProject({required int id, required String token}) async {
    final url = Uri.parse('https://dev.3bhady.com/api/v1/projects/$id');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Project.fromJson(jsonBody['project']);
    } else {
      print('Failed to load project: ${response.statusCode}');
      print(response.body);
      return null;
    }
  }

