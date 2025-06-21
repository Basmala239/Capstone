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
  final String createdAt;
  final String updatedAt;
  final Team? team;
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
    this.documentPath,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.team,
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
      tasks: (json['tasks'] as List).map((t) => Task.fromJson(t)).toList(),
    );
  }
}

class Team {
  final int id;
  final String name;
  final String description;
  final int leaderId;
  final int? projectId;
  final int supervisorId;
  final String status;
  final String? createdAt;
  final String? updatedAt;

  Team({
    required this.id,
    required this.name,
    required this.description,
    required this.leaderId,
    this.projectId,
    required this.supervisorId,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      leaderId: json['leader_id'],
      projectId: json['project_id'],
      supervisorId: json['supervisor_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Task {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String? dueDate;
  final int assignedToUserId;
  final int teamId;
  final int projectId;
  final String status;
  final String createdAt;
  final String updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    this.dueDate,
    required this.assignedToUserId,
    required this.teamId,
    required this.projectId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
      assignedToUserId: json['assigned_to_user_id'],
      teamId: json['team_id'],
      projectId: json['project_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
