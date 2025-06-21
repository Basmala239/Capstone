import 'package:http/http.dart' as http;
import '../../models/task.dart';

Future<void> createTask({required String token, required Task task}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/tasks');

  final request = http.MultipartRequest('POST', url)
    ..headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    })
    ..fields['title'] = task.title
    ..fields['description'] = task.description
    ..fields['status'] = task.status
    ..fields['start_date'] = '${task.startDate}'
    ..fields['due_date'] = '${task.dueDate}'
    ..fields['team_id'] = '${task.teamId}'
    ..fields['assigned_to_user_id'] = '${task.assignedToUserId}'
    ..fields['project_id'] = '${task.projectId}';

  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    print(responseBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Task created successfully.');
      print('Response: $responseBody');
    } else {
      print('Failed to create task.');
      print('Status: ${response.statusCode}');
      print('Error: $responseBody');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "تم إنشاء المهمة بنجاح.",
// "task": {
// "id": 9,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "status": "Pending",
// "start_date": "2025-06-15T00:00:00.000000Z",
// "due_date": "2025-06-20T00:00:00.000000Z",
// "team_id": "1",
// "assigned_to_user_id": "1",
// "project_id": "1",
// "created_at": "2025-06-20T23:35:26.000000Z",
// "updated_at": "2025-06-20T23:35:26.000000Z"
// }
// }
