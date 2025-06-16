class Attendance {
  final String studentName;
  final int status; // 1 = Present, maybe 0 = Absent
  final String attendanceTime;

  Attendance({
    required this.studentName,
    required this.status,
    required this.attendanceTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      studentName: json['student_name'],
      status: json['status'],
      attendanceTime: json['attendance_time'],
    );
  }
}
