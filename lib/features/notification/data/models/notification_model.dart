class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String startTime;
  final String endTime;
  final int teamId;
  final int createdByUserId;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.teamId,
    required this.createdByUserId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    startTime: json['start_time'],
    endTime: json['end_time'],
    teamId: json['team_id'],
    createdByUserId: json['created_by_user_id'],
  );
}
