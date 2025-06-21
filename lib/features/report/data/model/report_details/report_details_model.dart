
import 'package:capstone/features/report/data/model/report_details/task_model.dart';
import 'attendance_model.dart';

class ReportDetails {
  final String titleOfProject;
  final String meetingDate;
  final String supervisors;
  final String topicsDiscussed;
  final List<TaskReport> tasksGivenToStudents;
  final List<Attendance> attendance;

  ReportDetails({
    required this.titleOfProject,
    required this.meetingDate,
    required this.supervisors,
    required this.topicsDiscussed,
    required this.tasksGivenToStudents,
    required this.attendance,
  });

  factory ReportDetails.fromJson(Map<String, dynamic> json) {
    return ReportDetails(
      titleOfProject: json['title_of_project'],
      meetingDate: json['meeting_date'],
      supervisors: json['supervisors'],
      topicsDiscussed: json['topics_discussed'],
      tasksGivenToStudents: List<TaskReport>.from(
        (json['tasks_given_to_students'] ?? []).map((x) => TaskReport.fromJson(x)),
      ),
      attendance: List<Attendance>.from(
        (json['attendance'] ?? []).map((x) => Attendance.fromJson(x)),
      ),
    );
  }
}
