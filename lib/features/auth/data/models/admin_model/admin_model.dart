import '../app_user/app_user_model.dart';

class Admin implements AppUser {
  @override final int id;
  @override final String userType;
  final String name;
  @override final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  Admin({
    required this.id,
    required this.userType,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      userType: json['user_type'],
      name: json['name'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
