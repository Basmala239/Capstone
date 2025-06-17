class Task {
  final int id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime? dueDate;
  final int assignedToUserId;
  final int teamId;
  final int projectId;
  final String status;

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
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      dueDate: json['due_date'] != null ? DateTime.tryParse(json['due_date']) : null,
      assignedToUserId: json['assigned_to_user_id'],
      teamId: json['team_id'],
      projectId: json['project_id'],
      status: json['status'],
    );
  }
}
