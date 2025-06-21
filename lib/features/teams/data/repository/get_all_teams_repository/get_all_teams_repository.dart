import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/get_team_model.dart';

Future<List<Team>> getAllTeams({required String token}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/teams');
  final response = await http.get(url, headers: {
    'Authorization': 'Bearer $token',
    'Accept': 'application/json',
  });

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print(jsonData);
    final List teams = jsonData['teams'];
    return teams.map((team) => Team.fromJson(team)).toList();
  } else {
    throw Exception('Failed to load teams');
  }
}

// Teams Loaded Successfully
//
// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "",
// "teams": [
// {
// "id": 1,
// "name": "Capstone",
// "description": "team to create capstone project",
// "leader_id": 1,
// "project_id": 1,
// "supervisor_id": 1,
// "status": "active",
// "created_at": "2025-06-11T13:14:04.000000Z",
// "updated_at": "2025-06-11T13:14:04.000000Z",
// "supervisor": {
// "id": 1,
// "user_type": "supervisor",
// "name": "ahmed",
// "email": "supervisor@gmail.com",
// "department": "leader",
// "max_teams_allowed": 11,
// "availability": 1,
// "created_at": "2025-04-17T19:18:16.000000Z",
// "updated_at": "2025-06-19T19:38:38.000000Z"
// },
// "members": [
// {
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
// },
// {
// "id": 2,
// "user_type": "student",
// "name": "ahmed",
// "email": "user2@gmail.com",
// "github": "Link githup",
// "department": "CS",
// "year": "0000",
// "team_id": 1,
// "availability": 1,
// "created_at": "2025-03-02T12:45:16.000000Z",
// "updated_at": "2025-06-19T20:43:38.000000Z"
// },
// {
// "id": 3,
// "user_type": "student",
// "name": "Ali Hassan",
// "email": "ali.hassan@example.com",
// "github": "github.com/alihassan",
// "department": "CS",
// "year": "2004",
// "team_id": 1,
// "availability": 1,
// "created_at": "2025-06-19T21:23:52.000000Z",
// "updated_at": "2025-06-19T21:23:52.000000Z"
// },
// {
// "id": 5,
// "user_type": "student",
// "name": "Omar Khaled",
// "email": "omar.khaled@example.com",
// "github": "github.com/omarkhaled",
// "department": "CS",
// "year": "2002",
// "team_id": 1,
// "availability": 1,
// "created_at": "2025-06-19T21:23:52.000000Z",
// "updated_at": "2025-06-19T21:23:52.000000Z"
// }
// ],
// "tasks": [
// {
// "id": 1,
// "title": "capstone front end",
// "description": "design wep site",
// "start_date": "2025-06-11T14:30:53.000000Z",
// "due_date": null,
// "assigned_to_user_id": 1,
// "team_id": 1,
// "project_id": 1,
// "status": "Done",
// "created_at": "2025-06-11T14:31:24.000000Z",
// "updated_at": "2025-06-20T08:09:09.000000Z"
// },
// {
// "id": 3,
// "title": "تطوير خاصية البحث المتقدم",
// "description": "تتضمن بناء الواجهة الخلفية للبحث عن طريق الكلمات المفتاحية، والتصفية حسب المعايير المختلفة، وتحسين الأداء.",
// "start_date": "2025-06-25T09:00:00.000000Z",
// "due_date": "2025-07-10T17:00:00.000000Z",
// "assigned_to_user_id": 3,
// "team_id": 1,
// "project_id": 1,
// "status": "In Progress",
// "created_at": "2025-06-19T21:28:43.000000Z",
// "updated_at": "2025-06-19T21:28:43.000000Z"
// },
// {
// "id": 5,
// "title": "إعداد وثائق API",
// "description": "توثيق جميع نقاط نهاية API الجديدة مع أمثلة للطلبات والاستجابات.",
// "start_date": "2025-06-26T10:00:00.000000Z",
// "due_date": "2025-07-05T16:00:00.000000Z",
// "assigned_to_user_id": 2,
// "team_id": 1,
// "project_id": 1,
// "status": "To Do",
// "created_at": "2025-06-19T21:28:43.000000Z",
// "updated_at": "2025-06-19T21:28:43.000000Z"
// },
// {
// "id": 7,
// "title": "Review Project Requirements",
// "description": "Go through the new project requirements document.",
// "start_date": "2025-06-20T00:00:00.000000Z",
// "due_date": "2025-06-27T00:00:00.000000Z",
// "assigned_to_user_id": 3,
// "team_id": 1,
// "project_id": 1,
// "status": "Pending",
// "created_at": "2025-06-20T08:54:22.000000Z",
// "updated_at": "2025-06-20T08:54:22.000000Z"
// },
// {
// "id": 10,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "start_date": "2025-06-15T00:00:00.000000Z",
// "due_date": "2025-06-20T00:00:00.000000Z",
// "assigned_to_user_id": 1,
// "team_id": 1,
// "project_id": 1,
// "status": "Pending",
// "created_at": "2025-06-21T00:30:20.000000Z",
// "updated_at": "2025-06-21T00:30:20.000000Z"
// },
// {
// "id": 11,
// "title": "تصميم واجهة المستخدم",
// "description": "مهمة تصميم واجهة المستخدم للتطبيق.",
// "start_date": "2025-06-15T00:00:00.000000Z",
// "due_date": "2025-06-20T00:00:00.000000Z",
// "assigned_to_user_id": 1,
// "team_id": 1,
// "project_id": 1,
// "status": "Pending",
// "created_at": "2025-06-21T00:31:08.000000Z",
// "updated_at": "2025-06-21T00:31:08.000000Z"
// }
// ]
// },
// {
// "id": 3,
// "name": "فريق ألفا للمطورين",
// "description": "فريق متخصص في تطوير تطبيقات الويب والخدمات الخلفية.",
// "leader_id": 2,
// "project_id": null,
// "supervisor_id": 1,
// "status": "active",
// "created_at": null,
// "updated_at": null,
// "supervisor": {
// "id": 1,
// "user_type": "supervisor",
// "name": "ahmed",
// "email": "supervisor@gmail.com",
// "department": "leader",
// "max_teams_allowed": 11,
// "availability": 1,
// "created_at": "2025-04-17T19:18:16.000000Z",
// "updated_at": "2025-06-19T19:38:38.000000Z"
// },
// "members": [],
// "tasks": [
// {
// "id": 6,
// "title": "حملة تسويقية عبر البريد الإلكتروني",
// "description": "تصميم وتنفيذ حملة بريد إلكتروني للترويج للميزة الجديدة للمشروع الثاني.",
// "start_date": "2025-06-28T11:00:00.000000Z",
// "due_date": "2025-07-15T17:00:00.000000Z",
// "assigned_to_user_id": 4,
// "team_id": 3,
// "project_id": 3,
// "status": "Pending",
// "created_at": "2025-06-19T21:28:43.000000Z",
// "updated_at": "2025-06-19T21:28:43.000000Z"
// }
// ]
// },
// {
// "id": 4,
// "name": "فريق بيتا للمصممين",
// "description": "فريق إبداعي لتصميم واجهات المستخدم وتجربة المستخدم.",
// "leader_id": 3,
// "project_id": null,
// "supervisor_id": 1,
// "status": "active",
// "created_at": null,
// "updated_at": null,
// "supervisor": {
// "id": 1,
// "user_type": "supervisor",
// "name": "ahmed",
// "email": "supervisor@gmail.com",
// "department": "leader",
// "max_teams_allowed": 11,
// "availability": 1,
// "created_at": "2025-04-17T19:18:16.000000Z",
// "updated_at": "2025-06-19T19:38:38.000000Z"
// },
// "members": [],
// "tasks": []
// }
// ]
// }
