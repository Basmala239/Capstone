import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/get_all_model.dart';

Future<List<Project>> getAllProjects({required String token}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/projects');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == true && data['projects'] != null) {
        List<Project> projects = (data['projects'] as List)
            .map((projectJson) => Project.fromJson(projectJson))
            .toList();

        return projects;
      } else {
        throw Exception("No projects found.");
      }
    } else {
      throw Exception('Failed to fetch projects: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching projects: $e');
  }
}


// Response:
// {
// "status": true,
// "errNum": "S000",
// "msg": "",
// "projects": [
// {
// "id": 1,
// "title": "Capstone Project",
// "description": "project for high education school",
// "status": "pending",
// "origin_type": "internal",
// "availability": 1,
// "category": "wepsite",
// "team": {
// "id": 1,
// "name": "Capstone",
// "description": "team to create capstone project"
// },
// "tasks": [
// {
// "id": 1,
// "title": "capstone front end",
// "status": "Done"
// },
// {
// "id": 3,
// "title": "تطوير خاصية البحث المتقدم",
// "status": "In Progress"
// },
// {
// "id": 5,
// "title": "إعداد وثائق API",
// "status": "To Do"
// },
// {
// "id": 7,
// "title": "Review Project Requirements",
// "status": "Pending"
// },
// {
// "id": 10,
// "title": "تصميم واجهة المستخدم",
// "status": "Pending"
// },
// {
// "id": 11,
// "title": "تصميم واجهة المستخدم",
// "status": "Pending"
// }
// ]
// },
// {
// "id": 6,
// "title": "E-commerce Platform Redesign",
// "description": "Redesigning an existing e-commerce website for better user experience and performance.",
// "status": "completed",
// "category": "Web Development",
// "availability": 0,
// "document_path": "/documents/ecommerce-report.pdf",
// "team": {
// "id": 3,
// "name": "فريق ألفا للمطورين",
// "description": "فريق متخصص في تطوير تطبيقات الويب والخدمات الخلفية."
// },
// "tasks": []
// },
// {
// "id": 8,
// "title": "University Branding Campaign",
// "description": "Creating new visual branding guidelines and marketing materials for the university.",
// "status": "pending",
// "category": "Graphic Design",
// "availability": 1,
// "team": {
// "id": 3,
// "name": "فريق ألفا للمطورين",
// "description": "فريق متخصص في تطوير تطبيقات الويب والخدمات الخلفية."
// },
// "tasks": []
// }
// ]
// }
