import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:flutter/material.dart';
// import '../../data/models/task_model.dart';
// import '../../data/models/team_member_model.dart';
import 'assigned_user_chip.dart';
import 'custom_text_row.dart';
import 'package:capstone/utils/here.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  ///[Here.number6] replace List[TeamMemberModel] with task.members[TaskModel]
  final List<TeamMemberModel> teamMembers;
  final VoidCallback onSeeMore;
  final bool showAssignButton;
  final VoidCallback? onAssign;
  // final VoidCallback? onDone; // Add this line
  final Widget? bottomActions;

  const TaskCard({
    super.key,
    required this.task,
    required this.teamMembers,
    required this.onSeeMore,
    this.showAssignButton = false,
    this.onAssign,
    // this.onDone, // Add this line
    this.bottomActions,
  });

  static const Map<TaskStatus, Color> statusColors = {
    TaskStatus.profTask: Color(0xFF1886CC), // blue
    TaskStatus.toDo: Color(0xFF1886CC), // blue
    TaskStatus.inProgress: Colors.red, // red
    TaskStatus.inReview: Colors.orange, // orange
    TaskStatus.completed: Colors.green, // green
  };

  ///[Here.number7] make next & previous buttons clickable for assigned members only
  ///[Here.number8] make next in in_review tab for leader & supervisor
  @override
  Widget build(BuildContext context) {
    final assignedMembers = task.members;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColors[task.status],
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            task.description,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          if (TaskStatus.profTask == task.status) ...[
            Row(
              children: [
                CustomTextRow(
                  label: 'Due Date:',
                  value:
                      '${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: onSeeMore,
                  icon: const Text('See More'),
                  label: const Icon(Icons.arrow_forward_ios, size: 12),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ] else
            CustomTextRow(
              label: 'Due Date:',
              value:
                  '${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
            ),
          if (assignedMembers.isNotEmpty &&
              task.status != TaskStatus.profTask) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Assign to:',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                //MARK: Make it clickable
                Expanded(child: AssignedUserChip(teamMembers: assignedMembers)),
                // Add Done button if status is not completed
                // if (task.status != TaskStatus.completed)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 8.0),
                //     child: ElevatedButton(
                //       onPressed: onDone,
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green,
                //         minimumSize: const Size(50, 32),
                //         padding: const EdgeInsets.symmetric(horizontal: 12),
                //       ),
                //       child: const Text(
                //         'Done',
                //         style: TextStyle(fontSize: 12, color: Colors.white),
                //       ),
                //     ),
                //   ),
                TextButton.icon(
                  onPressed: onSeeMore,
                  icon: const Text('See More'),
                  label: const Icon(Icons.arrow_forward_ios, size: 12),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
          if (bottomActions != null) ...[
            const SizedBox(height: 12),
            bottomActions!,
          ],
        ],
      ),
    );
  }
}
