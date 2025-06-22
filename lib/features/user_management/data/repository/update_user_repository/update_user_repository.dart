import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> updateUser({
  required String token,
  required int userId,
  required String userType,
  required String name,
  String? teamId,
  String? github,
  String? department,
  String? year,
  String? availability,
  String? maxTeamsAllowed,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/users/$userType/$userId');

  var request = http.MultipartRequest('PUT', uri)
    ..headers['Authorization'] = 'Bearer $token'
    ..headers['Accept'] = 'application/json'
    ..fields['name'] = name;

  if (userType == 'student') {
    if (teamId != null) request.fields['team_id'] = teamId;
    if (github != null) request.fields['github'] = github;
    if (department != null) request.fields['department'] = department;
    if (year != null) request.fields['year'] = year;
  } else if (userType == 'supervisor') {
    if (availability != null) request.fields['availability'] = availability;
    if (department != null) request.fields['department'] = department;
    if (maxTeamsAllowed != null) {
      request.fields['max_teams_allowed'] = maxTeamsAllowed;
    }
  }

  final response = await request.send();
  final responseBody = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(responseBody);
    print('User updated successfully: $responseBody');
    return jsonData['status'];
  } else {
    print('Failed to update user. Status: ${response.statusCode}');
    print('Response: $responseBody');
    try {
      final jsonData = jsonDecode(responseBody);
      return jsonData['status'];
    } catch (_) {
      return false;
    }
  }
}
