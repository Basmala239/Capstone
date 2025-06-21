import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/single_team_model.dart';

Future<Team?> getTeamDetails({required String token, required int teamId}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/teams/$teamId');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Team.fromJson(body['team']);
    } else {
      print('Failed to load team: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }

  return null;
}

// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "",
// "team": {
// "id": 1,
// "name": "Capstone",
// "description": "team to create capstone project",
// "leader_id": 1,
// "project_id": 1,
// "supervisor_id": 1,
// "status": "active",
// "created_at": "2025-06-11T13:14:04.000000Z",
// "updated_at": "2025-06-11T13:14:04.000000Z",
//
// "students": [
// {
// "id": 1,
// "name": "user1",
// "email": "user1@gmail.com",
// "department": "IT",
// "year": "0000",
// "availability": 1
// },
// {
// "id": 2,
// "name": "ahmed",
// "email": "user2@gmail.com",
// "department": "CS",
// "year": "0000",
// "github": "Link githup"
// },
// {
// "id": 3,
// "name": "Ali Hassan",
// "email": "ali.hassan@example.com",
// "department": "CS",
// "year": "2004",
// "github": "github.com/alihassan"
// },
// {
// "id": 5,
// "name": "Omar Khaled",
// "email": "omar.khaled@example.com",
// "department": "CS",
// "year": "2002",
// "github": "github.com/omarkhaled"
// }
// ],
//
// "supervisor": {
// "id": 1,
// "name": "ahmed",
// "email": "supervisor@gmail.com",
// "department": "leader",
// "max_teams_allowed": 11
// },
//
// "projects": [
// {
// "id": 1,
// "title": "Capstone Project",
// "description": "project for high education school",
// "status": "pending",
// "category": "wepsite",
// "tasks": [
// {
// "id": 1,
// "title": "capstone front end",
// "description": "design wep site",
// "status": "Done"
// },
// {
// "id": 3,
// "title": "تطوير خاصية البحث المتقدم",
// "description": "تتضمن بناء الواجهة الخلفية للبحث عن طريق الكلمات المفتاحية، والتصفية حسب المعايير المختلفة، وتحسين الأداء.",
// "status": "In Progress"
// },
// {
// "id": 5,
// "title": "إعداد وثائق API",
// "description": "توثيق جميع نقاط نهاية API الجديدة مع أمثلة للطلبات والاستجابات.",
// "status": "To Do"
// },
// {
// "id": 7,
// "title": "Review Project Requirements",
// "description": "Go through the new project requirements document.",
// "status": "Pending"
// },
// {
// "id": 10,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "status": "Pending"
// },
// {
// "id": 11,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "status": "Pending"
// }
// ]
// }
// ],
//
// "meetings": [
// {
// "id": 1,
// "title": "important meeting",
// "description": "important meeting",
// "start_time": "2025-06-21T13:54:28.000000Z",
// "end_time": "2025-06-21T20:59:25.000000Z",
// "attendances": [
// {
// "student_id": 1,
// "attendance_time": "2025-06-21T13:53:12.000000Z",
// "status": 1
// }
// ]
// },
// {
// "id": 3,
// "title": "mun meeting",
// "description": "meeting with back end",
// "start_time": "2025-06-21T21:09:57.000000Z",
// "end_time": "2025-06-21T21:09:57.000000Z",
// "attendances": [
// {
// "student_id": 1,
// "attendance_time": "2025-06-21T00:00:02.000000Z",
// "status": 1
// }
// ]
// },
// {
// "id": 4,
// "title": "Important Team Sync",
// "description": "Discussing next sprint goals.",
// "start_time": "2025-06-21T14:00:00.000000Z",
// "end_time": "2025-06-21T15:00:00.000000Z",
// "attendances": []
// },
// {
// "id": 5,
// "title": "title",
// "description": "asssssssssssssssssssssss",
// "start_time": "2025-06-21T15:43:00.000000Z",
// "end_time": "2025-06-21T16:43:00.000000Z",
// "attendances": []
// },
// {
// "id": 6,
// "title": "title",
// "description": "dddddd",
// "start_time": "2025-06-21T16:02:00.000000Z",
// "end_time": "2025-06-21T17:02:00.000000Z",
// "attendances": []
// }
// ]
// }
// }
