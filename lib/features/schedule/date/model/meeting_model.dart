class MeetingModel {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final int teamId;
  final int createdByUserId;

  MeetingModel({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.teamId,
    required this.createdByUserId,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "start_time": startTime.toIso8601String().split('T').join(' ').split('.').first,
    "end_time": endTime.toIso8601String().split('T').join(' ').split('.').first,
    "team_id": teamId,
    "created_by_user_id": createdByUserId,
  };
}
