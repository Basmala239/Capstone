class Team {
  final int id;
  final String name;
  final String description;
  final Supervisor supervisor;
  final List<Member> members;
  final List<Task> tasks;

  Team({
    required this.id,
    required this.name,
    required this.description,
    required this.supervisor,
    required this.members,
    required this.tasks,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      supervisor: Supervisor.fromJson(json['supervisor']),
      members: (json['members'] as List).map((m) => Member.fromJson(m)).toList(),
      tasks: (json['tasks'] as List).map((t) => Task.fromJson(t)).toList(),
    );
  }
}

class Supervisor {
  final String name;
  final String email;

  Supervisor({required this.name, required this.email});

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      name: json['name'],
      email: json['email'],
    );
  }
}

class Member {
  final String name;
  final String email;
  final String department;

  Member({
    required this.name,
    required this.email,
    required this.department,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      email: json['email'],
      department: json['department'],
    );
  }
}

class Task {
  final String title;
  final String status;

  Task({required this.title, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      status: json['status'],
    );
  }
}
