import 'package:flutter/material.dart';
import '../../data/student_model.dart';

class SelectedMemberChip extends StatelessWidget {
  final Student student;
  final VoidCallback onRemove;

  const SelectedMemberChip({
    super.key,
    required this.student,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(student.profileImage),
        ),
        label: Text(
          student.name,
          style: const TextStyle(fontSize: 12),
        ),
        deleteIcon: const Icon(Icons.close, size: 16),
        onDeleted: onRemove,
        backgroundColor: Colors.blue[50],
        deleteIconColor: Colors.grey[600],
      ),
    );
  }
}
