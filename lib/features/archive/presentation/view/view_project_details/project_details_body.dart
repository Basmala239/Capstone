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
              Text(project.title, style: sectionTitle),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [_buildInfoRow("Title", project.title),
                          const SizedBox(height: 8),
                          _buildInfoRow("Status", project.status),
                          const SizedBox(height: 8),
                          _buildInfoRow("Category", project.category),
                          const SizedBox(height: 10),
                          Text("Description ", style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(project.description),
                        ]
                    )
                ),
              ),
              const SizedBox(height: 20),

              // Team Info
              Text("Team Info", style: sectionTitle),
              const SizedBox(height: 8),
              Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow("Name", project.team.name),
                            const SizedBox(height: 8),
                            _buildInfoRow("Status", project.team.status),

                            const SizedBox(height: 10),
                            Text("Description ", style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(project.team.description)
                          ]
                      )
                  )
              ),
              const SizedBox(height: 20),

              // Tasks
              Text("Tasks", style: sectionTitle),
              ...project.tasks.map((task) =>
                  Card(
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 3,
            child: Text('$label :',
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 5, child: Text(value)),
      ],
    );
  }

  TextStyle get titleStyle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle get subtitleStyle => const TextStyle(fontSize: 16);

  TextStyle get sectionTitle =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
}
