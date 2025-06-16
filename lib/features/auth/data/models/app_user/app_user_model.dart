class AppUser {
  final int id;
  final String? name;
  final String email;
  final String userType;
  final int? teamId;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    this.teamId,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userType: json['user_type'],
      teamId: json['team_id'],
    );
  }
}
