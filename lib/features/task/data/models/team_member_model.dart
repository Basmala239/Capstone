import 'package:capstone/utils/here.dart';

class TeamMemberModel {
  //MARK: Add tasks field
// final List<TaskModel> tasks; >>>>  //fakes
// final List<ProjectModel> projects;
/// [Here.number2] number 2
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String role;
  // final bool isActive;

  TeamMemberModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.role,
    // required this.isActive,
  });

  TeamMemberModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    String? role,
    bool? isActive,
  }) {
    return TeamMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      // isActive: isActive ?? this.isActive,
    );
  }
}
