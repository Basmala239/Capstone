///el class da gamil>> bas msta4dem [TeamMemberModel] badl [TeamMember] 
import 'package:capstone/features/task/data/models/team_member_model.dart';

class TeamMember {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? avatarUrl;

  TeamMember({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.avatarUrl,
  });

  TeamMember copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? avatarUrl,
  }) {
    return TeamMember(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
