class Team {
  final int id;
  final String name;
  final String description;
  final int leaderId;
  final int supervisorId;
  final String status;
  final List<Student> students;
  final Supervisor supervisor;
  final List<Project> projects;
  final List<Meeting> meetings;

  Team({
    required this.id,
    required this.name,
    required this.description,
    required this.leaderId,
    required this.supervisorId,
    required this.status,
    required this.students,
    required this.supervisor,
    required this.projects,
    required this.meetings,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      leaderId: json['leader_id'],
      supervisorId: json['supervisor_id'],
      status: json['status'],
      students: (json['students'] as List)
          .map((s) => Student.fromJson(s))
          .toList(),
      supervisor: Supervisor.fromJson(json['supervisor']),
      projects: (json['projects'] as List)
          .map((p) => Project.fromJson(p))
          .toList(),
      meetings: (json['meetings'] as List)
          .map((m) => Meeting.fromJson(m))
          .toList(),
    );
  }
}

class Student {
  final int id;
  final String name;
  final String email;
  final String? github;
  final String department;
  final String year;

  Student({
    required this.id,
    required this.name,
    required this.email,
    this.github,
    required this.department,
    required this.year,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      github: json['github'],
      department: json['department'],
      year: json['year'],
    );
  }
}

class Supervisor {
  final int id;
  final String name;
  final String email;
  final String department;

  Supervisor({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      department: json['department'],
    );
  }
}

class Project {
  final int id;
  final String title;
  final String description;
  final String category;
  final List<Task> tasks;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.tasks,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      tasks: (json['tasks'] as List)
          .map((t) => Task.fromJson(t))
          .toList(),
    );
  }
}

class Task {
  final int id;
  final String title;
  final String description;
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }
}

class Meeting {
  final int id;
  final String title;
  final String description;
  final List<Attendance> attendances;

  Meeting({
    required this.id,
    required this.title,
    required this.description,
    required this.attendances,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      attendances: (json['attendances'] as List)
          .map((a) => Attendance.fromJson(a))
          .toList(),
    );
  }
}

class Attendance {
  final int id;
  final int studentId;
  final String attendanceTime;

  Attendance({
    required this.id,
    required this.studentId,
    required this.attendanceTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      studentId: json['student_id'],
      attendanceTime: json['attendance_time'],
    );
  }
}
