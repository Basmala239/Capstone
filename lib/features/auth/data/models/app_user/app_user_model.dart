import '../admin_model/admin_model.dart';
import '../student_model/student_model.dart';
import '../supervisor_model/supervisor_model.dart';

abstract class AppUser {
  int get id;
  String get email;
  String get userType;
}
AppUser parseUser(Map<String, dynamic> json) {
  final type = json['user_type'];

  switch (type) {
    case 'student': return Student.fromJson(json);
    case 'admin': return Admin.fromJson(json);
    case 'supervisor': return Supervisor.fromJson(json);
    default: throw Exception('Unknown user $type');
  }
}