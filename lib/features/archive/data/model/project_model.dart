import 'task_model.dart';
import 'team_model.dart';

class Project {
  final int id;
  final String title;
  final String description;
  final String status;
  final String originType;
  final int originId;
  final int availability;
  final int teamId;
  final String? documentPath;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Team team;
  final List<Task> tasks;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.originType,
    required this.originId,
    required this.availability,
    required this.teamId,
    required this.documentPath,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.team,
    required this.tasks,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      originType: json['origin_type'],
      originId: json['origin_id'],
      availability: json['availability'],
      teamId: json['team_id'],
      documentPath: json['document_path'],
      category: json['category'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      team: Team.fromJson(json['team']),
      tasks: (json['tasks'] as List).map((e) => Task.fromJson(e)).toList(),
    );
  }
}
