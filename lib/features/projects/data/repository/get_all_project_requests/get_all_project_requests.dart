import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/project_request.dart';

Future<List<ProjectRequest>> getAllProjectRequests({required String token}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/project-requests');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    if (body['status'] == true && body['project_requests'] != null) {
      return (body['project_requests'] as List)
          .map((e) => ProjectRequest.fromJson(e))
          .toList();
    } else {
      throw Exception('API error: ${body['msg']}');
    }
  } else {
    throw Exception('HTTP error: ${response.statusCode}');
  }
}


// {
// "status": true,
// "errNum": "S000",
// "msg": "",
// "project_requests": [
// {
// "id": 9,
// "title": "طلب مشروع تطبيق محمول جديد",
// "description": "نطلب تطوير تطبيق محمول لإدارة المهام للمشاريع الصغيرة.",
// "category": "Mobile Development",
// "status": "pending",
// "requested_by": 3,
// "team": {
// "id": 1,
// "name": "Capstone",
// "description": "team to create capstone project"
// },
// "admin_notes": null,
// "start_date": null,
// "end_date": null,
// "created_at": "2025-06-15T13:30:30Z"
// },
// {
// "id": 10,
// "title": "طلب تصميم موقع إلكتروني تعليمي",
// "description": "نحتاج إلى تصميم وتطوير موقع تعليمي تفاعلي لطلاب الجامعة.",
// "category": "Web Design",
// "status": "approved",
// "requested_by": 4,
// "team": {
// "id": 3,
// "name": "فريق ألفا للمطورين",
// "description": "فريق متخصص في تطوير تطبيقات الويب والخدمات الخلفية."
// },
// "admin_notes": "تمت الموافقة من قبل الإدارة.",
// "start_date": "2025-06-20",
// "end_date": "2025-10-31",
// "created_at": "2025-06-15T13:30:30Z"
// },
// {
// "id": 11,
// "title": "طلب نظام إدارة موارد بشرية",
// "description": "طلب تطوير نظام HR متكامل، لكن الميزانية غير كافية حالياً.",
// "category": "Human Resources",
// "status": "rejected",
// "requested_by": 3,
// "team": {
// "id": 4,
// "name": "فريق بيتا للمصممين",
// "description": "فريق إبداعي لتصميم واجهات المستخدم وتجربة المستخدم."
// },
// "admin_notes": "تم الرفض لعدم توفر الموارد حالياً.",
// "start_date": null,
// "end_date": null,
// "created_at": "2025-06-15T13:30:30Z"
// }
// ]
// }
