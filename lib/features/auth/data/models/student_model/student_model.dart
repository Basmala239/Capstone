import '../app_user/app_user_model.dart';

class Student implements AppUser {
  @override
  final int id;
  @override
  final String userType;
  @override
  final String name;
  @override
  final String email;
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
    required this.name,
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
      name: json['name'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_type': userType,
      'name': name,
      'email': email,
      'github': github,
      'department': department,
      'year': year,
      'team_id': teamId,
      'availability': availability,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
