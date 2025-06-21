class Team {
  final int id;
  final String name;
  final String description;

  Team({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class ProjectRequest {
  final int id;
  final String title;
  final String description;
  final String category;
  final String status;
  final int teamId;
  final Team team;
  final String? startDate;
  final String? endDate;
  final String? adminNotes;

  ProjectRequest({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.teamId,
    required this.team,
    this.startDate,
    this.endDate,
    this.adminNotes,
  });

  factory ProjectRequest.fromJson(Map<String, dynamic> json) {
    return ProjectRequest(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      status: json['status'],
      teamId: json['team_id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      adminNotes: json['admin_notes'],
      team: Team.fromJson(json['team']),
    );
  }
}
