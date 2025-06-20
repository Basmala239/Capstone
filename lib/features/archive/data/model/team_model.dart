class TeamMember {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final bool isLeader;

  TeamMember({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.isLeader,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      isLeader: json['is_leader'],
    );
  }
}