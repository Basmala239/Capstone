import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import '../../data/models/team_member_model.dart';

class AssignedUserChip extends StatelessWidget {
  final List<TeamMemberModel> teamMembers;
  final int maxVisible;

  const AssignedUserChip({
    super.key,
    required this.teamMembers,
    this.maxVisible = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: teamMembers.length > maxVisible 
            ? maxVisible + 1 
            : teamMembers.length,
        itemBuilder: (context, index) {
          if (index == maxVisible && teamMembers.length > maxVisible) {
            return Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '+${teamMembers.length - maxVisible}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          
          final member = teamMembers[index];
          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: CircleAvatar(
              radius: 14,
                backgroundImage: member.avatarUrl.isNotEmpty
                  ? CachedNetworkImageProvider(member.avatarUrl)
                  : null,
              backgroundColor: const Color(0xFF1886CC),
              child: member.avatarUrl.isEmpty
                  ? Text(
                      member.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
