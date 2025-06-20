import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final List<String> skills;

  const SkillsSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.blue[800],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
