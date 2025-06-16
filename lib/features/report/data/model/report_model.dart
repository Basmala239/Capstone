class Report {
  final int id;
  final String meetingDate;
  final String comment;
  final String teamName;
  final String viewDetailsUrl;

  Report({
    required this.id,
    required this.meetingDate,
    required this.comment,
    required this.teamName,
    required this.viewDetailsUrl,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      meetingDate: json['meeting_date'],
      comment: json['comment'],
      teamName: json['team_name'],
      viewDetailsUrl: json['view_details_url'],
    );
  }
}
