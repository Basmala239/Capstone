import 'package:flutter/material.dart';
import '../../data/project_idea_model.dart';

class ProjectIdeaCard extends StatelessWidget {
  final ProjectIdeaModel project;
  final VoidCallback onSeeMore;

  const ProjectIdeaCard({
    super.key,
    required this.project,
    required this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfessorInfo(),
              SizedBox(height: 12),
              _buildProjectDescription(),

              SizedBox(height: 16),
              _buildSeeMoreButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfessorInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[00],
          backgroundImage: NetworkImage(project.professorAvatar),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.professorName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.grey[900],
                ),
              ),
              Text(
                project.projectName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectDescription() {
    return Text(
      project.shortDescription,
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
    );
  }


  Widget _buildSeeMoreButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: onSeeMore,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text('See More'),
      ),
    );
  }
}
