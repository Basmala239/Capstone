class TaskReport {
  final int id;
  final String title;
  final String status;
  final String assignedTo;

  TaskReport({
    required this.id,
    required this.title,
    required this.status,
    required this.assignedTo,
  });

  factory TaskReport.fromJson(Map<String, dynamic> json) {
    return TaskReport(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      assignedTo: json['assigned_to'],
    );
  }
}
