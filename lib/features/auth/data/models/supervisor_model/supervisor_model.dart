import '../app_user/app_user_model.dart';

class Supervisor implements AppUser {
  @override final int id;
  @override final String email;
  @override final String userType;
  final String name;
  final String department;
  final int maxTeamsAllowed;
  final int availability;

  Supervisor({
    required this.id,
    required this.email,
    required this.userType,
    required this.name,
    required this.department,
    required this.maxTeamsAllowed,
    required this.availability,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json['id'],
      email: json['email'],
      userType: json['user_type'],
      name: json['name'],
      department: json['department'],
      maxTeamsAllowed: json['max_teams_allowed'],
      availability: json['availability'],
    );
  }

  @override
  // TODO: implement teamId
  int? get teamId => throw UnimplementedError();
}
