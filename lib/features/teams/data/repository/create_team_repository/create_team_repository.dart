import 'package:http/http.dart' as http;

Future<void> createTeam({
  required String token,
  required String name,
  required String description,
  required int supervisorId,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/teams');

  final request = http.MultipartRequest('POST', url)
    ..headers['Authorization'] = 'Bearer $token'
    ..fields['name'] = name
    ..fields['description'] = description
    ..fields['supervisor_id'] = supervisorId.toString();

  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Team created successfully');
      print(responseBody);
    } else {
      print('Failed to create team');
      print('Status: ${response.statusCode}');
      print('Error: $responseBody');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

// Team Created Successfully
//
// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "تم إنشاء الفريق بنجاح.",
// "team": {
// "id": 6,
// "name": "الفريق الذهبي",
// "description": "وصف مشروع الفريق الذهبي",
// "supervisor_id": "1",
// "created_at": "2025-06-21T01:49:14.000000Z",
// "updated_at": "2025-06-21T01:49:14.000000Z"
// }
// }