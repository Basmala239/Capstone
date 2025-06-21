import '../app_user/app_user_model.dart';

class Supervisor implements AppUser {
  @override
  final int id;
  @override
  final String userType;
  @override
  String name;
  @override
  final String email;
  final String department;
  int? maxTeamsAllowed =0;
  final int availability;
  final DateTime createdAt;
  final DateTime updatedAt;

  Supervisor({
    required this.id,
    required this.userType,
    required this.name,
    required this.email,
    required this.department,
    required this.maxTeamsAllowed,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json['id'],
      userType: json['user_type'],
      name: json['name'],
      email: json['email'],
      department: json['department'],
      maxTeamsAllowed: json['max_teams_allowed'],
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
      'department': department,
      'max_teams_allowed': maxTeamsAllowed,
      'availability': availability,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

}