import 'dart:convert';
import 'package:capstone/features/task/data/models/task.dart';
import 'package:http/http.dart' as http;

Future<void> updateTask({required String token, required Task task}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/tasks/${task.id}');

  final request = http.MultipartRequest('PUT', url)
    ..headers['Authorization'] = 'Bearer $token'
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

    if (response.statusCode == 200) {
      print('✅ Task updated successfully.');
      print('Response: $responseBody');
    } else {
      print('❌ Failed to update task.');
      print('Status: ${response.statusCode}');
      print('Error: $responseBody');
    }
  } catch (e) {
    print('⚠️ Exception occurred: $e');
  }
}

// Task Updated Successfully
//
// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "تم تحديث المهمة بنجاح.",
// "task": {
// "id": 9,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "status": "Pending",
// "start_date": "2025-06-15T00:00:00.000000Z",
// "due_date": "2025-06-20T00:00:00.000000Z",
// "assigned_to_user_id": 1,
// "team_id": 1,
// "project_id": 1,
// "created_at": "2025-06-20T23:35:26.000000Z",
// "updated_at": "2025-06-20T23:35:26.000000Z",
// "team": {
// "id": 1,
// "name": "Capstone",
// "description": "team to create capstone project",
// "leader_id": 1,
// "project_id": 1,
// "supervisor_id": 1,
// "status": "active",
// "created_at": "2025-06-11T13:14:04.000000Z",
// "updated_at": "2025-06-11T13:14:04.000000Z"
// }
// }
// }
