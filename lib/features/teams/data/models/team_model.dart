import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/teams/data/models/project_model.dart';


// import 'team_member.dart';

class TeamModel {
  final String id;
  final String name;
  final ProjectModel project;
  final String? teamImageUrl;
  final TeamMemberModel supervisor;
  final List<TeamMemberModel> members;
  final List<TaskModel> tasks;
  final String leaderId;
  final bool isComplete; // جديد

  TeamModel({
    required this.id,
    required this.name,
    required this.project,
    this.teamImageUrl,
    required this.supervisor,
    required this.members,
    required this.tasks,
    required this.leaderId,
    this.isComplete = false, // افتراضي
  });

  TeamMemberModel get leader => members.firstWhere((member) => member.id == leaderId);

  TeamModel copyWith({
    String? id,
    String? name,
    ProjectModel? project,
    String? teamImageUrl,
    TeamMemberModel? supervisor,
    List<TeamMemberModel>? members,
    List<TaskModel>? tasks,
    String? leaderId,
    bool? isComplete,
  }) {
    return TeamModel(
      id: id ?? this.id,
      name: name ?? this.name,
      project: project ?? this.project,
      teamImageUrl: teamImageUrl ?? this.teamImageUrl,
      supervisor: supervisor ?? this.supervisor,
      members: members ?? this.members,
      tasks: tasks ?? this.tasks,
      leaderId: leaderId ?? this.leaderId,
      isComplete: isComplete ?? this.isComplete,
    );
  }

}
