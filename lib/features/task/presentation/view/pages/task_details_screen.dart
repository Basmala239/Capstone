import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/task/presentation/view/widgets/assigned_user_chip.dart';
import 'package:flutter/material.dart';
// import '../../data/models/task_model.dart';
// import '../../data/models/team_member_model.dart';
import '../widgets/attachment_section.dart';
// import 'package:capstone/utils/here.dart';
// import 'package:capstone/features/task/data/models/note_model.dart';
import 'package:capstone/features/task/presentation/view/pages/notes_screen.dart';
import 'package:capstone/features/task/data/services/task_service.dart';
// import 'package:capstone/features/task/data/services/task_service_note_update.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;
  final List<TeamMemberModel> teamMembers;
  final bool isTeamLeader;

  const TaskDetailsScreen({
    super.key,
    required this.task,
    required this.teamMembers,
    this.isTeamLeader = false,
  });

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late TaskModel _task;
  final TaskService _taskService = TaskService();

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  Future<void> _refreshTask() async {
    final allTasks = await _taskService.getAllTasks();
    final updated = allTasks.firstWhere(
      (t) => t.id == _task.id,
      orElse: () => _task,
    );
    setState(() {
      _task = updated;
    });
  }

  Future<void> _updateTaskNotes(List<String> notes) async {
    await _taskService.updateTaskNotes(_task.id, notes);
    await _refreshTask();
  }

  @override
  Widget build(BuildContext context) {
    // final assignedMembers = task.members;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          _task.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF1886CC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _task.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // عرض تواريخ كل حالة
            if (_task.statusTimestamps.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Status History:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ...(() {
                    // collect all status timestamps into a list of MapEntry
                    // where each entry is a MapEntry<TaskStatus, DateTime>
                    final List<MapEntry<TaskStatus, DateTime>> allEntries = [];
                    _task.statusTimestamps.forEach((status, dts) {
                      for (final dt in dts) {
                        allEntries.add(MapEntry(status, dt));
                      }
                    });
                    // sort by date
                    allEntries.sort((a, b) => a.value.compareTo(b.value));
                    return allEntries.map((entry) {
                      final status = entry.key;
                      final dt = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text(
                          '${status.name}: '
                          '${dt.day}/${dt.month}/${dt.year}  ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                      );
                    });
                  })(),
                ],
              ),
            // if (_task.statusTimestamps.isNotEmpty)
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         'Status History:',
            //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            //       ),
            //       ...TaskStatus.values.expand((status) {
            //         final dts = _task.statusTimestamps[status];
            //         if (dts == null) return [];
            //         return dts.map((dt) {
            //           DateTime date;
            //           date = dt;
            //           return Padding(
            //             padding: const EdgeInsets.only(top: 2, bottom: 2),
            //             child: Text(
            //               '${status.name}: '
            //               '${date.day}/${date.month}/${date.year}  ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
            //               style: const TextStyle(
            //                 fontSize: 12,
            //                 color: Colors.blueGrey,
            //               ),
            //             ),
            //           );
            //         });
            //       }),
            //     ],
            //   ),
            if (_task.status == TaskStatus.completed &&
                _task.completedAt != null) ...[
              const SizedBox(height: 6),
              Text(
                'Task completed at: '
                '${_task.completedAt!.day}/${_task.completedAt!.month}/${_task.completedAt!.year}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                _task.description,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_task.status != TaskStatus.profTask) ...[
                  Text(
                    'Assign to:',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  AssignedUserChip(
                    teamMembers: _task.members,
                    maxVisible: _task.members.length,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1886CC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${_task.dueDate.day}/${_task.dueDate.month}/${_task.dueDate.year}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1886CC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.note, color: Colors.white, size: 16),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => NotesScreen(
                                      notes:
                                          _task.notes
                                              .map(
                                                (n) => Note(
                                                  content: n,
                                                  author: 'Unknown',
                                                  date: _task.dueDate,
                                                ),
                                              )
                                              .toList(),
                                      isTeamLeader: widget.isTeamLeader,
                                    ),
                              ),
                            );
                            if (result is List<Note>) {
                              await _updateTaskNotes(
                                result.map((e) => e.content).toList(),
                              );
                            }
                          },
                          child: const Text(
                            "Notes",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AttachmentSection(
              attachments: _task.attachments,
              showAddButton: true,
              onAddAttachment: () async {
                final result = await AttachmentSection.showAddAttachmentDialog(
                  context,
                );
                if (result != null) {
                  await _taskService.addAttachmentToTask(_task.id, result);
                  await _refreshTask();
                }
              },
              onRefresh: _refreshTask,
            ),
          ],
        ),
      ),
    );
  }
}
