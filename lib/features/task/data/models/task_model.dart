import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/utils/here.dart';
class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
 //MARK: Make notes list of strings
  final List<String> notes;
  final TaskStatus status;
  //MARK: Add list of member field
  final List<TeamMemberModel> members;
  final List<AttachmentModel> attachments;
  //MARK: Add createdAt and updatedAt fields later
  /// [Here.number1] number 1
  // final DateTime createdAt;
  // final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.notes,
    required this.status,
    required this.members,
    required this.attachments,
    // required this.createdAt,
    // required this.updatedAt,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    List<String>? notes,
    TaskStatus? status,
    List<TeamMemberModel>? members,
    List<AttachmentModel>? attachments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      members: members ?? this.members,
      attachments: attachments ?? this.attachments,
      // createdAt: createdAt ?? this.createdAt,
      // updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

enum TaskStatus {
  profTask,
  toDo,
  inProgress,
  inReview,
  completed,
}

class AttachmentModel {
  final String id;
  final String name;
  final String url;
  final AttachmentType type;

  AttachmentModel({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
  });
}

enum AttachmentType {
  image,
  pdf,
  document,
}
