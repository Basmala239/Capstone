class NotificationModel {
  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;
  final NotificationData data;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      notifiableType: json['notifiable_type'],
      notifiableId: json['notifiable_id'],
      data: NotificationData.fromJson(json['data']),
      readAt: json['read_at'] != null ? DateTime.tryParse(json['read_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class NotificationData {
  final String type;
  final int meetingId;
  final String title;
  final String description;
  final String startTime;
  final String teamName;
  final String message;

  NotificationData({
    required this.type,
    required this.meetingId,
    required this.title,
    required this.description,
    required this.startTime,
    required this.teamName,
    required this.message,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      type: json['type'],
      meetingId: json['meeting_id'],
      title: json['title'],
      description: json['description'],
      startTime: json['start_time'],
      teamName: json['team_name'],
      message: json['message'],
    );
  }
}