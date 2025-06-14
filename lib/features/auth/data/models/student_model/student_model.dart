import '../app_user/app_user_model.dart';

class Student implements AppUser{
  @override final int id;
  @override final String userType;
  final String studentName;
  @override final String email;
  final String? github;
  final String department;
  final String year;
  final int teamId;
  final int availability;
  final DateTime createdAt;
  final DateTime updatedAt;

  Student({
    required this.id,
    required this.userType,
    required this.studentName,
    required this.email,
    this.github,
    required this.department,
    required this.year,
    required this.teamId,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      userType: json['user_type'],
      studentName: json['student_name'],
      email: json['email'],
      github: json['github'],
      department: json['department'],
      year: json['year'],
      teamId: json['team_id'],
      availability: json['availability'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
