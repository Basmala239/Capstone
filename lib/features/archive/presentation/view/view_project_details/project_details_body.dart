import 'package:flutter/material.dart';
import '../../../data/model/project_model.dart';
import '../../../data/repository/get_project_repository.dart';

class ProjectDetailsBody extends StatefulWidget {
  final String token;
  final int id;
  const ProjectDetailsBody({super.key, required this.token, required this.id});

  @override
  State<ProjectDetailsBody> createState() => _ProjectDetailsBodyState();
}

class _ProjectDetailsBodyState extends State<ProjectDetailsBody> {
  late Future<Project?> _projectFuture;

  @override
  void initState() {
    super.initState();
    _projectFuture = getProject(widget.token, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Project?>(
        future: _projectFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text(" Failed to load project."));
          }

          final project = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Info
                Text(" Title: ${project.title}", style: titleStyle),
                Text(" Description: ${project.description}", style: subtitleStyle),
                Text(" Status: ${project.status}", style: subtitleStyle),
                Text(" Category: ${project.category}", style: subtitleStyle),
                const SizedBox(height: 20),

                // Team Info
                Text(" Team Info", style: sectionTitle),
                Text(" Name: ${project.team.name}", style: subtitleStyle),
                Text(" Description: ${project.team.description}", style: subtitleStyle),
                Text(" Status: ${project.team.status}", style: subtitleStyle),
                const SizedBox(height: 20),

                // Tasks
                Text(" Tasks", style: sectionTitle),
                ...project.tasks.map((task) => Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    trailing: Text(task.status),
                  ),
                )),
              ],
            ),
          );
        },
    );
  }

  TextStyle get titleStyle => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get subtitleStyle => const TextStyle(fontSize: 16);
  TextStyle get sectionTitle => const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
}
