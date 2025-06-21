import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/task_submission.dart';

Future<List<TaskSubmission>> getTaskSubmissions({
  required int taskId,
  required String token,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/tasks/$taskId/submissions');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    final List submissionsJson = data['submissions'] ?? [];

    return submissionsJson
        .map((json) => TaskSubmission.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load submissions: ${response.statusCode}');
  }
}



// import 'package:url_launcher/url_launcher.dart';
//
// Future<void> openFile(String url) async {
//   final uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }


// {status: false, errNum: AUTH002, msg: ليس لديك صلاحية لعرض تسليمات هذه المهمة.}


// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "",
// "submissions": [
// {
// "id": 3,
// "task_id": 1,
// "student_id": 1,
// "description": "تم تسليم المسودة الأولى لتصميم واجهة المستخدم. يرجى المراجعة.",
// "file_path": "task_submissions/101/ui_design_v1.pdf",
// "status": "submitted",
// "submission_date": "2025-06-20T07:55:04.000000Z",
// "created_at": "2025-06-20T07:55:04.000000Z",
// "updated_at": "2025-06-20T07:55:04.000000Z",
// "supervisor_notes": null,
// "student": {
// "id": 1,
// "user_type": "student",
// "name": "user1",
// "email": "user1@gmail.com",
// "github": null,
// "department": "IT",
// "year": "0000",
// "team_id": 1,
// "availability": 1,
// "created_at": "2025-03-02T12:27:54.000000Z",
// "updated_at": "2025-04-17T17:10:12.000000Z"
// }
// },
// {
// "id": 9,
// "task_id": 1,
// "student_id": 1,
// "description": "هذا ملف خاص بالAPIs",
// "file_path": "task_submissions/1/5MI2UbkcSNrFLkl8gPvUl4LKjxDye98bvaJKAKTh.rar",
// "status": "approved",
// "submission_date": "2025-06-20T08:06:30.000000Z",
// "created_at": "2025-06-20T08:06:30.000000Z",
// "updated_at": "2025-06-20T08:09:09.000000Z",
// "supervisor_notes": "العمل ممتاز، تم الموافقة عليه.",
// "student": {
// "id": 1,
// "user_type": "student",
// "name": "user1",
// "email": "user1@gmail.com",
// "github": null,
// "department": "IT",
// "year": "0000",
// "team_id": 1,
// "availability": 1,
// "created_at": "2025-03-02T12:27:54.000000Z",
// "updated_at": "2025-04-17T17:10:12.000000Z"
// }
// }
// ]
// }
