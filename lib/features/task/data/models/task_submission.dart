class Student {
  final int id;
  final String name;
  final String email;
  final String department;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      department: json['department'] ?? '',
    );
  }
}

class TaskSubmission {
  final int id;
  final int taskId;
  final int studentId;
  final String description;
  final String filePath;
  final String status;
  final String submissionDate;
  final String? supervisorNotes;
  final Student student;

  TaskSubmission({
    required this.id,
    required this.taskId,
    required this.studentId,
    required this.description,
    required this.filePath,
    required this.status,
    required this.submissionDate,
    required this.supervisorNotes,
    required this.student,
  });
  //to get file
  String get fullFileUrl => 'https://dev.3bhady.com/storage/$filePath';

  factory TaskSubmission.fromJson(Map<String, dynamic> json) {
    return TaskSubmission(
      id: json['id'],
      taskId: json['task_id'],
      studentId: json['student_id'],
      description: json['description'],
      filePath: json['file_path'],
      status: json['status'],
      submissionDate: json['submission_date'],
      supervisorNotes: json['supervisor_notes'],
      student: Student.fromJson(json['student']),
    );
  }
}
