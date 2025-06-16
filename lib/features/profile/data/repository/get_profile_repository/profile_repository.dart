import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../auth/data/models/admin_model/admin_model.dart';
import '../../../../auth/data/models/app_user/app_user_model.dart';
import '../../../../auth/data/models/student_model/student_model.dart';
import '../../../../auth/data/models/supervisor_model/supervisor_model.dart';

Future<AppUser?> getProfile(String token) async {
  const String url = 'https://dev.3bhady.com/api/v1/profile';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final jsonResponse = json.decode(response.body);
    print("Profile Response: $jsonResponse");

    if (jsonResponse['status'] == true && jsonResponse['user'] != null) {
      final userJson = jsonResponse['user'];
      final userType = userJson['user_type'];

      if (userType == 'student') {
        print('get student profile');
        return Student.fromJson(userJson);
      } else if (userType == 'admin') {
        print('get admin profile');
        return Admin.fromJson(userJson); // Define similarly
      } else if (userType == 'supervisor') {
        print('get supervisor profile');
        return Supervisor.fromJson(userJson); // Define similarly
      } else {
        return AppUser.fromJson(userJson);
      }
    } else {
      print('Failed to get profile: ${jsonResponse['msg']}');
      return null;
    }
  } catch (e) {
    print('Exception in getProfile: $e');
    return null;
  }
}
