class Team {
  final int id;
  final String name;
  final String description;
  final int leaderId;
  final int projectId;
  final int supervisorId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Team({
    required this.id,
    required this.name,
    required this.description,
    required this.leaderId,
    required this.projectId,
    required this.supervisorId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
