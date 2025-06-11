import 'package:capstone/features/report/data/attendance_model.dart';

class ReportModel{
  String title;
  String supervisorName;
  String date;
  String ?topicsDiscussed;
  String ?tasks;
  List<AttendanceModel>attendance;
  ReportModel(this.title,this.supervisorName,this.date,this.topicsDiscussed,this.tasks,this.attendance);
}
