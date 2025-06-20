import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';
import '../models/team_member_model.dart';

class TaskService {
  // Singleton instance to ensure only one instance of TaskService exists
  // Mohamed Kandil yorsel ta7iat
  static final TaskService _instance = TaskService._internal();
  factory TaskService() => _instance;
  TaskService._internal();

  // Dummy data
  late final List<TeamMemberModel> _dummyTeamMembers = [
    TeamMemberModel(
      id: '1',
      name: 'Ahmed Ali',
      email: 'ahmed@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      role: 'leader',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '2',
      name: 'Sara Mohamed',
      email: 'sara@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '3',
      name: 'Omar Hassan',
      email: 'omar@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '4',
      name: 'Mona Khaled',
      email: 'mona@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=4',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '5',
      name: 'Youssef Adel',
      email: 'youssef@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '6',
      name: 'Laila Samir',
      email: 'laila@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=6',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '7',
      name: 'Mohamed Tarek',
      email: 'mtarek@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=7',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '8',
      name: 'Fatma Nabil',
      email: 'fatma@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=8',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '9',
      name: 'Khaled Mostafa',
      email: 'khaled@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      role: 'student',
      // isActive: true,
    ),
    TeamMemberModel(
      id: '10',
      name: 'Nourhan Magdy',
      email: 'nourhan@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=10',
      role: 'student',
      // isActive: true,
    ),
  ];
 // Dummy tasks data tany :)
  late final List<TaskModel> _dummyTasks = (() {
    final now = DateTime.now();
    return [
      TaskModel(
        id: '1',
        title: 'task1',
        description: "mohamed kandil yorsel ta7iat",
        dueDate: now.add(const Duration(days: 7)),
        notes: ['Important'],
        status: TaskStatus.profTask,
        members: [_dummyTeamMembers[0], _dummyTeamMembers[1], _dummyTeamMembers[2],
          _dummyTeamMembers[3], _dummyTeamMembers[4], _dummyTeamMembers[5],
          _dummyTeamMembers[6], _dummyTeamMembers[7], _dummyTeamMembers[8],
          _dummyTeamMembers[9]],
        attachments: [
          AttachmentModel(
            id: 'a1',
            name: 'Project Brief.pdf',
            url: 'https://example.com/project_brief.pdf',
            type: AttachmentType.pdf,
          ),
          AttachmentModel(
            id: 'a2',
            name: 'Design Link',
            url: 'https://figma.com/file/xyz',
            type: AttachmentType.document,
          ),
          AttachmentModel(
            id: 'a3',
            name: 'Reference Link',
            url: 'https://flutter.dev',
            type: AttachmentType.document,
          ),
          AttachmentModel(
            id: 'a4',
            name: 'App Screenshot.png',
            url: 'https://example.com/screenshot.png',
            type: AttachmentType.image,
          ),
        ],
        createdAt: now.subtract(const Duration(days: 0)),
      ),
      TaskModel(
        id: '2',
        title: 'task2',
        description: 'Design the main screens.',
        dueDate: now.add(const Duration(days: 8)),
        notes: ['UI/UX'],
        status: TaskStatus.toDo,
        members: [_dummyTeamMembers[0], _dummyTeamMembers[1], _dummyTeamMembers[2],
          _dummyTeamMembers[3], _dummyTeamMembers[4], _dummyTeamMembers[5],
          _dummyTeamMembers[6], _dummyTeamMembers[7], _dummyTeamMembers[8],
          _dummyTeamMembers[9]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 1)),
      ),
      TaskModel(
        id: '3',
        title: 'API Integration',
        description: 'Integrate backend APIs with the app.',
        dueDate: now.add(const Duration(days: 9)),
        notes: ['Check all endpoints'],
        status: TaskStatus.inProgress,
        members: [_dummyTeamMembers[5], _dummyTeamMembers[6]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      TaskModel(
        id: '4',
        title: 'Testing',
        description: 'Write unit and integration tests.',
        dueDate: now.add(const Duration(days: 10)),
        notes: ['Cover all features'],
        status: TaskStatus.inReview,
        members: [_dummyTeamMembers[7], _dummyTeamMembers[8]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 3)),
      ),
      TaskModel(
        id: '5',
        title: 'Deploy to Production',
        description: 'Deploy the app to the production environment.',
        dueDate: now.add(const Duration(days: 11)),
        notes: ['Notify all stakeholders'],
        status: TaskStatus.completed,
        members: [_dummyTeamMembers[9]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 4)),
      ),
      TaskModel(
        id: '6',
        title: 'Client Meeting',
        description: 'Present the project progress to the client.',
        dueDate: now.add(const Duration(days: 12)),
        notes: ['Prepare slides'],
        status: TaskStatus.profTask,
        members: [_dummyTeamMembers[0], _dummyTeamMembers[3], _dummyTeamMembers[6]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 5)),
      ),
      TaskModel(
        id: '7',
        title: 'Bug Fixing',
        description: 'Fix reported bugs from QA.',
        dueDate: now.add(const Duration(days: 13)),
        notes: ['Prioritize critical bugs'],
        status: TaskStatus.inProgress,
        members: [_dummyTeamMembers[1], _dummyTeamMembers[4], _dummyTeamMembers[7]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 6)),
      ),
      TaskModel(
        id: '8',
        title: 'Code Review',
        description: 'Review code for the new features.',
        dueDate: now.add(const Duration(days: 14)),
        notes: ['Follow coding standards'],
        status: TaskStatus.inReview,
        members: [_dummyTeamMembers[2], _dummyTeamMembers[5], _dummyTeamMembers[8]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 7)),
      ),
      TaskModel(
        id: '9',
        title: 'Update Dependencies',
        description: 'Update all project dependencies to latest versions.',
        dueDate: now.add(const Duration(days: 15)),
        notes: ['Test after update'],
        status: TaskStatus.toDo,
        members: [_dummyTeamMembers[3], _dummyTeamMembers[6], _dummyTeamMembers[9]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 8)),
      ),
      TaskModel(
        id: '10',
        title: 'Optimize Performance',
        description: 'Improve app performance and reduce load times.',
        dueDate: now.add(const Duration(days: 16)),
        notes: ['Profile before and after'],
        status: TaskStatus.inProgress,
        members: [_dummyTeamMembers[0], _dummyTeamMembers[4], _dummyTeamMembers[8]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 9)),
      ),
      TaskModel(
        id: '11',
        title: 'Security Audit',
        description: 'Conduct a security audit of the application.',
        dueDate: now.add(const Duration(days: 17)),
        notes: ['Check for vulnerabilities'],
        status: TaskStatus.inReview,
        members: [_dummyTeamMembers[1], _dummyTeamMembers[5], _dummyTeamMembers[7]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 10)),
      ),
      TaskModel(
        id: '12',
        title: 'Prepare Release Notes',
        description: 'Write release notes for the new version.',
        dueDate: now.add(const Duration(days: 18)),
        notes: ['Highlight new features'],
        status: TaskStatus.completed,
        members: [_dummyTeamMembers[2], _dummyTeamMembers[6], _dummyTeamMembers[9]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 11)),
      ),
      TaskModel(
        id: '13',
        title: 'Sprint Planning',
        description: 'Plan tasks for the next sprint.',
        dueDate: now.add(const Duration(days: 19)),
        notes: ['Include all team members'],
        status: TaskStatus.profTask,
        members: [
          _dummyTeamMembers[0],
          _dummyTeamMembers[1],
          _dummyTeamMembers[2],
          _dummyTeamMembers[3],
          _dummyTeamMembers[4],
          _dummyTeamMembers[5],
          _dummyTeamMembers[6],
          _dummyTeamMembers[7],
          _dummyTeamMembers[8],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 12)),
      ),
      TaskModel(
        id: '14',
        title: 'Refactor Codebase',
        description: 'Refactor old modules for better maintainability.',
        dueDate: now.add(const Duration(days: 20)),
        notes: ['No breaking changes'],
        status: TaskStatus.toDo,
        members: [
          _dummyTeamMembers[1],
          _dummyTeamMembers[3],
          _dummyTeamMembers[5],
          _dummyTeamMembers[7],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 13)),
      ),
      TaskModel(
        id: '15',
        title: 'Setup CI/CD',
        description: 'Setup continuous integration and deployment pipelines.',
        dueDate: now.add(const Duration(days: 21)),
        notes: ['Automate tests'],
        status: TaskStatus.inProgress,
        members: [
          _dummyTeamMembers[0],
          _dummyTeamMembers[2],
          _dummyTeamMembers[4],
          _dummyTeamMembers[6],
          _dummyTeamMembers[8],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 14)),
      ),
      TaskModel(
        id: '16',
        title: 'User Feedback',
        description: 'Collect and analyze user feedback.',
        dueDate: now.add(const Duration(days: 22)),
        notes: ['Prepare survey'],
        status: TaskStatus.inReview,
        members: [
          _dummyTeamMembers[1],
          _dummyTeamMembers[3],
          _dummyTeamMembers[5],
          _dummyTeamMembers[7],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 15)),
      ),
      TaskModel(
        id: '17',
        title: 'Update Landing Page',
        description: 'Redesign the landing page for better conversion.',
        dueDate: now.add(const Duration(days: 23)),
        notes: ['A/B test new design'],
        status: TaskStatus.completed,
        members: [
          _dummyTeamMembers[0],
          _dummyTeamMembers[2],
          _dummyTeamMembers[4],
          _dummyTeamMembers[6],
          _dummyTeamMembers[8],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 16)),
      ),
      TaskModel(
        id: '18',
        title: 'Team Training',
        description: 'Organize a training session for the team.',
        dueDate: now.add(const Duration(days: 24)),
        notes: ['Invite external trainer'],
        status: TaskStatus.profTask,
        members: [
          _dummyTeamMembers[1],
          _dummyTeamMembers[3],
          _dummyTeamMembers[5],
          _dummyTeamMembers[7],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 17)),
      ),
      TaskModel(
        id: '19',
        title: 'Mobile Responsiveness',
        description: 'Ensure the app is fully responsive on mobile devices.',
        dueDate: now.add(const Duration(days: 25)),
        notes: ['Test on multiple devices'],
        status: TaskStatus.toDo,
        members: [
          _dummyTeamMembers[0],
          _dummyTeamMembers[1],
          _dummyTeamMembers[2],
          _dummyTeamMembers[3],
          _dummyTeamMembers[4],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 18)),
      ),
      TaskModel(
        id: '20',
        title: 'Add Notifications',
        description: 'Implement push notifications for important events.',
        dueDate: now.add(const Duration(days: 26)),
        notes: ['Use Firebase'],
        status: TaskStatus.inProgress,
        members: [
          _dummyTeamMembers[5],
          _dummyTeamMembers[6],
          _dummyTeamMembers[7],
          _dummyTeamMembers[8],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 19)),
      ),
      TaskModel(
        id: '21',
        title: 'Analytics Dashboard',
        description: 'Create a dashboard for analytics.',
        dueDate: now.add(const Duration(days: 27)),
        notes: ['Show key metrics'],
        status: TaskStatus.inReview,
        members: [
          _dummyTeamMembers[0],
          _dummyTeamMembers[4],
          _dummyTeamMembers[8],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 20)),
      ),
      TaskModel(
        id: '22',
        title: 'Content Update',
        description: 'Update the app content for the new semester.',
        dueDate: now.add(const Duration(days: 28)),
        notes: ['Check all sections'],
        status: TaskStatus.completed,
        members: [
          _dummyTeamMembers[1],
          _dummyTeamMembers[5],
          _dummyTeamMembers[9],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 21)),
      ),
      TaskModel(
        id: '23',
        title: 'Accessibility Improvements',
        description: 'Improve accessibility for all users.',
        dueDate: now.add(const Duration(days: 29)),
        notes: ['Follow WCAG guidelines'],
        status: TaskStatus.profTask,
        members: [
          _dummyTeamMembers[2],
          _dummyTeamMembers[6],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 22)),
      ),
      TaskModel(
        id: '24',
        title: 'Localization',
        description: 'Add support for multiple languages.',
        dueDate: now.add(const Duration(days: 30)),
        notes: ['Arabic & English'],
        status: TaskStatus.toDo,
        members: [
          _dummyTeamMembers[3],
          _dummyTeamMembers[7],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 23)),
      ),
      TaskModel(
        id: '25',
        title: 'Backup System',
        description: 'Implement regular backups for the database.',
        dueDate: now.add(const Duration(days: 31)),
        notes: ['Daily schedule'],
        status: TaskStatus.inProgress,
        members: [
          _dummyTeamMembers[4],
          _dummyTeamMembers[8],
        ],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 24)),
      ),
      TaskModel(
        id: '26',
        title: 'Test1',
        description: "mohamed kandil yorsel ta7iat.......This is a dummy task description for task1. It includes details about the task, its requirements, and any additional information that might be relevant for the team members assigned to this task. The description can be as detailed as necessary to ensure clarity and understanding among the team members. This task is part of a larger project and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task. ..this task is part of a larger project and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task. this task is part of a larger project and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task.... and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task. and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task. This task is part of a larger project and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task. from task1. It includes details about the task, its requirements, and any additional information that might be relevant for the team members assigned to this task. The description can be as detailed as necessary to ensure clarity and understanding among the team members. This task is part of a larger project and is expected to be completed within the specified due date. Team members are encouraged to collaborate and communicate effectively to ensure the successful completion of this task.",
        dueDate: now.add(const Duration(days: 7)),
        notes: ['Important'],
        status: TaskStatus.profTask,
        members: [_dummyTeamMembers[0], _dummyTeamMembers[1], _dummyTeamMembers[2],
          _dummyTeamMembers[3], _dummyTeamMembers[4], _dummyTeamMembers[5],
          _dummyTeamMembers[6], _dummyTeamMembers[7], _dummyTeamMembers[8],
          _dummyTeamMembers[9]],
        attachments: [],
        createdAt: now.subtract(const Duration(days: 25)),
      ),
    ];
  })();

  static const String _tasksKey = 'tasks_list';

  Future<void> saveTasksToPrefs(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((t) => jsonEncode(_taskToMap(t))).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  Future<List<TaskModel>> loadTasksFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey);
    if (tasksJson == null) {
      await saveTasksToPrefs(_dummyTasks);
      return List.from(_dummyTasks);
    }
    return tasksJson.map((t) => _taskFromMap(jsonDecode(t))).toList();
  }

  Map<String, dynamic> _taskToMap(TaskModel task) => {
    'id': task.id,
    'title': task.title,
    'description': task.description,
    'dueDate': task.dueDate.toIso8601String(),
    'notes': task.notes,
    'status': task.status.index,
    'members': task.members.map((m) => m.id).toList(),
    'attachments': task.attachments.map((a) => {
      'id': a.id,
      'name': a.name,
      'url': a.url,
      'type': a.type.index,
    }).toList(),
    'completedAt': task.completedAt?.toIso8601String(),
    'createdAt': task.createdAt.toIso8601String(),
    'statusTimestamps': task.statusTimestamps.map((k, v) => MapEntry(k.index.toString(), v.map((dt) => dt.toIso8601String()).toList())),
  };

  TaskModel _taskFromMap(Map<String, dynamic> map) {
    List<TeamMemberModel> members = (map['members'] as List)
      .map((id) => _dummyTeamMembers.firstWhere((m) => m.id == id, orElse: () => _dummyTeamMembers[0]))
      .toList();
    List<AttachmentModel> attachments = (map['attachments'] as List?)?.map((a) => AttachmentModel(
      id: a['id'],
      name: a['name'],
      url: a['url'],
      type: AttachmentType.values[a['type']],
    )).toList() ?? [];
    Map<TaskStatus, List<DateTime>> statusTimestamps = {};
    if (map['statusTimestamps'] != null) {
      final raw = map['statusTimestamps'];
      if (raw is Map) {
        raw.forEach((k, v) {
          final status = TaskStatus.values[int.parse(k)];
          if (v is List) {
            statusTimestamps[status] = v.map((dt) => DateTime.parse(dt)).toList();
          } else if (v is String) {
            statusTimestamps[status] = [DateTime.parse(v)];
          }
        });
      }
    }
    final createdAt = map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now();
    // إذا لم يوجد statusTimestamps، أضف الحالة الحالية بتاريخ الإنشاء
    if (statusTimestamps.isEmpty) {
      final status = TaskStatus.values[map['status']];
      statusTimestamps[status] = [createdAt];
    }
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      notes: List<String>.from(map['notes']),
      status: TaskStatus.values[map['status']],
      members: members,
      attachments: attachments,
      completedAt: map['completedAt'] != null ? DateTime.tryParse(map['completedAt']) : null,
      createdAt: createdAt,
      statusTimestamps: statusTimestamps,
    );
  }

  // Get all tasks
  Future<List<TaskModel>> getAllTasks() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));
    return await loadTasksFromPrefs();
  }

  // Get tasks by status
  Future<List<TaskModel>> getTasksByStatus(TaskStatus status) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _dummyTasks.where((task) => task.status == status).toList();
  }

  // Get all team members
  Future<List<TeamMemberModel>> getAllTeamMembers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_dummyTeamMembers);
  }

  // Assign task
  Future<bool> assignTask(String taskId, List<String> userIds) async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate success/failure randomly
    return DateTime.now().millisecond % 2 == 0;
  }

  // Add new task
  Future<bool> addTask(TaskModel task) async {
    await Future.delayed(const Duration(seconds: 1));
    final tasks = await loadTasksFromPrefs();
    tasks.add(task);
    await saveTasksToPrefs(tasks);
    return true;
  }

  // Update task status by id
  Future<bool> updateTaskStatus(String taskId, TaskStatus newStatus) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final tasks = await loadTasksFromPrefs();
    final index = tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final oldTask = tasks[index];
      final updatedTimestamps = Map<TaskStatus, List<DateTime>>.from(oldTask.statusTimestamps);
      final now = DateTime.now();
      // أضف التاريخ الجديد دون حذف أي تواريخ سابقة
      final prevList = updatedTimestamps[newStatus] ?? [];
      updatedTimestamps[newStatus] = List<DateTime>.from(prevList)..add(now);
      tasks[index] = oldTask.copyWith(
        status: newStatus,
        completedAt: newStatus == TaskStatus.completed ? now : oldTask.completedAt,
        statusTimestamps: updatedTimestamps,
      );
      await saveTasksToPrefs(tasks);
      return true;
    }
    return false;
  }

  Future<void> clearAllTasksFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
  }
  

  Future<void> refreshTasksInPrefs() async {
    await saveTasksToPrefs(_dummyTasks);
  }

  Future<void> updateTaskNotes(String taskId, List<String> notes) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // يجب تحديث نسخة SharedPreferences وليس فقط _dummyTasks
    final tasks = await loadTasksFromPrefs();
    final index = tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final oldTask = tasks[index];
      tasks[index] = oldTask.copyWith(
        notes: notes,
        // احتفظ بجميع الخصائص الأخرى كما هي
        attachments: oldTask.attachments,
        statusTimestamps: oldTask.statusTimestamps,
      );
      await saveTasksToPrefs(tasks);
    }
  }
  Future<void> addAttachmentToTask(String taskId, AttachmentModel attachment) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // تحميل المهام من SharedPreferences
    final tasks = await loadTasksFromPrefs();
    final index = tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final oldTask = tasks[index];
      tasks[index] = oldTask.copyWith(
        attachments: [...oldTask.attachments, attachment],
        updatedAt: DateTime.now(),
      );
      await saveTasksToPrefs(tasks);
    }
  }
}










