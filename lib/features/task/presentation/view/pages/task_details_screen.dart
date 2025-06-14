import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/task/presentation/view/widgets/assigned_user_chip.dart';
import 'package:flutter/material.dart';
// import '../../data/models/task_model.dart';
// import '../../data/models/team_member_model.dart';
import '../widgets/attachment_section.dart';
import 'package:capstone/utils/here.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskModel task;

  ///[Here.number6] replace List[TeamMemberModel] with task.members[TaskModel]
  final List<TeamMemberModel> teamMembers;

  const TaskDetailsScreen({
    super.key,
    required this.task,
    required this.teamMembers,
  });

  ///[Here.number4] number4 ..Make [AssignedUserChip] clickable
  ///[Here.number5] number5 ..Make [Notes] clickable and display notes page
  @override
  Widget build(BuildContext context) {
    // final assignedMembers = task.members;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          task.title,
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
              task.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                task.description,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Assign to:',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                //MARK: Make it clickable
                if (task.status != TaskStatus.profTask) ...[
                  AssignedUserChip(
                    teamMembers: task.members,
                    maxVisible: task.members.length,
                  ),
                ]
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
                          '${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
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
                        //MARK: Displaying notes page
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Notes",
                            style: const TextStyle(
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
            const AttachmentSection(attachments: []),
          ],
        ),
      ),
    );
  }
}
