import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> addUser({
  required String token,
  required String name,
  required String email,
  required String password,
  required String userType,
  String? teamId,
  String? github,
  String? department,
  String? year,
  String? studentName,
  String? maxTeamsAllowed,
  String? availability,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/users');

  final request = http.MultipartRequest('POST', url)
    ..headers['Authorization'] = 'Bearer $token'
    ..headers['Accept'] = 'application/json'
    ..fields['name'] = name
    ..fields['email'] = email
    ..fields['password'] = password
    ..fields['user_type'] = userType;


  if (userType == 'student') {
    if (teamId != null) request.fields['team_id'] = teamId;
    if (github != null) request.fields['github'] = github;
    if (department != null) request.fields['department'] = department;
    if (year != null) request.fields['year'] = year;
    if (studentName != null) request.fields['student_name'] = studentName;
  } else if (userType == 'supervisor') {
    if (availability != null) request.fields['availability'] = availability;
    if (department != null) request.fields['department'] = department;
    if (maxTeamsAllowed != null) {
      request.fields['max_teams_allowed'] = maxTeamsAllowed;
    }
  }

  final response = await request.send();

  final responseBody = await response.stream.bytesToString();
  final body = await jsonDecode(responseBody);
  if ((response.statusCode == 200 || response.statusCode == 201) &&body['status']==true){
    print('✅ User created: $body');
    return true;
  } else {
    print('❌ Failed to create user. Status: ${response.statusCode}');
    print('Error: $responseBody');
    return false;
  }
}
