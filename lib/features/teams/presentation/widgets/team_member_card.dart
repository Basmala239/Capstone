import 'package:capstone/features/task/data/models/team_member_model.dart';
// import 'package:capstone/features/teams/data/models/team_member.dart';
import 'package:flutter/material.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMemberModel member;
  final bool isLarge;

  const TeamMemberCard({
    super.key,
    required this.member,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 16 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2196F3), width: 2),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: isLarge ? 30 : 24,
            backgroundImage: member.avatarUrl.isNotEmpty
                ? NetworkImage(member.avatarUrl)
                : null,
            backgroundColor: Colors.grey[300],
            child: member.avatarUrl.isEmpty
                ? Icon(
                    Icons.person,
                    size: isLarge ? 30 : 24,
                    color: Colors.grey[600],
                  )
                : null,
          ),
          SizedBox(height: isLarge ? 12 : 8),
          Text(
            member.name,
            style: TextStyle(
              fontSize: isLarge ? 16 : 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isLarge ? 4 : 2),
          Text(
            member.email,
            style: TextStyle(
              fontSize: isLarge ? 12 : 10,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isLarge ? 4 : 2),
          Text(
            member.role,
            style: TextStyle(
              fontSize: isLarge ? 12 : 10,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
