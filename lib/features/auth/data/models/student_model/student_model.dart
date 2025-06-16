import '../app_user/app_user_model.dart';

class Student extends AppUser {
  final String studentName;
  final String department;
  final String year;
  final int? teamId;
  final bool availability;

  Student({
    required int id,
    required String email,
    required this.studentName,
    required this.department,
    required this.year,
    this.teamId,
    required this.availability,
    required String userType,
  }) : super(name:studentName,id: id, email: email, userType: userType);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      email: json['email'],
      studentName: json['name'],
      department: json['department'],
      year: json['year'],
      teamId: json['team_id'],
      availability: json['availability'] == 1,
      userType: json['user_type'],
    );
  }
}
