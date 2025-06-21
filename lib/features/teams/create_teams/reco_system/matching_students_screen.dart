import 'package:flutter/material.dart';
import 'student_reco_model.dart';

class MatchingStudentsScreen extends StatelessWidget {
  final List<StudentRecoModel> students;
  const MatchingStudentsScreen({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matching Students')),
      body: students.isEmpty
          ? const Center(child: Text('No matching students found.'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(student.name[0])),
                    title: Text(student.name),
                    subtitle: Text(student.email),
                    trailing: Wrap(
                      spacing: 6,
                      children: student.tools.map((tool) => Chip(label: Text(tool))).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
