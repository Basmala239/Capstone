import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../data/project_idea_model.dart';
import '../widgets/skills_section.dart';

class ProjectIdeaDetailsScreen extends StatelessWidget {
  final ProjectIdeaModel project;

  const ProjectIdeaDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(project.projectName , style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Background(),
              Expanded(
                child: _buildContent(context),
              ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfessorInfo(),
            SizedBox(height: 20),
            _buildProjectDescription(),
            SizedBox(height: 20),
            SkillsSection(skills: project.requiredSkills),
            SizedBox(height: 32),
            _buildRequestButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessorInfo() {
    return Container(
      width: double.infinity,
              padding: const EdgeInsets.all(8),
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[00],
            backgroundImage: NetworkImage(project.professorAvatar),
          ),
          SizedBox(width: 16),
          Text(
            project.professorName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectDescription() {
    return  Container(
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
                project.fullDescription,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            );
  }


  Widget _buildRequestButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _onRequestPressed(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        child: Text('Request'),
      ),
    );
  }

  void _onRequestPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Sent'),
          content: Text(
            'Your request to join "${project.projectName}" has been sent to ${project.professorName}.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to list
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


