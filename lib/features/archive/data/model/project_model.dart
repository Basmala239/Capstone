
import 'package:capstone/features/archive/data/model/team_model.dart';

class Project {
  final int id;
  final String title;
  final String supervisor;
  final String description;
  final List<String> tools;
  final int year;
  final List<TeamMember> teamMembers;

  Project({
    required this.id,
    required this.title,
    required this.supervisor,
    required this.description,
    required this.tools,
    required this.year,
    required this.teamMembers,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      supervisor: json['supervisor'],
      description: json['description'],
      tools: List<String>.from(json['tools']),
      year: json['year'],
      teamMembers: (json['team_members'] as List)
          .map((tm) => TeamMember.fromJson(tm))
          .toList(),
    );
  }
}