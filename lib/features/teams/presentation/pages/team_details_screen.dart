

import 'package:capstone/features/teams/data/models/team_model.dart';
import 'package:capstone/features/teams/presentation/widgets/team_details.dart';

import 'package:flutter/material.dart';

class TeamDetailsScreen extends StatelessWidget {
  final TeamModel team;

  const TeamDetailsScreen({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          team.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: TeamDetails(
        myTeam: team,
        isLoading: false, // Set to true if loading data
        errorMessage: null, // Set to an error message if there's an error
        onRetry: () {}, // Define what happens on retry
      ),


      // body: TeamScreen(
      //   myTeam: team,
      //   isLoading: false,
      //   errorMessage: null,
      //   onRetry: () {},
      // ),
      // body: Stack(
      //   children: [
      //     const Background(),
      //     SingleChildScrollView(
      //     padding: const EdgeInsets.all(16),
      //     child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Team Header
      //                   Row(
      //         children: [
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(12),
      //             child: team.teamImageUrl != null && team.teamImageUrl!.isNotEmpty
      //                 ? Image.network(
      //                     team.teamImageUrl!,
      //                     width: 60,
      //                     height: 60,
      //                     fit: BoxFit.cover,
      //                     errorBuilder: (context, error, stackTrace) => Container(
      //                       width: 60,
      //                       height: 60,
      //                       color: Colors.grey[200],
      //                       child: const Icon(
      //                         Icons.groups,
      //                         size: 30,
      //                         color: Colors.grey,
      //                       ),
      //                     ),
      //                   )
      //                 : Container(
      //                     width: 60,
      //                     height: 60,
      //                     color: Colors.grey[200],
      //                     child: const Icon(
      //                       Icons.groups,
      //                       size: 30,
      //                       color: Colors.grey,
      //                     ),
      //                   ),
      //           ),
      //           const SizedBox(width: 16),
      //           Expanded(
      //             child: Text(
      //               team.project.name,
      //               style: const TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),

      //       const SizedBox(height: 24),
            
      //       // Project Description
      //       Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(16),
      //         decoration: BoxDecoration(
      //           color: Colors.grey[50],
      //           borderRadius: BorderRadius.circular(12),
      //           border: Border.all(color: Colors.grey[200]!),
      //         ),
      //         child: Text(
      //           team.project.description,
      //           style: TextStyle(
      //             fontSize: 14,
      //             color: Colors.grey[700],
      //             height: 1.5,
      //           ),
      //         ),
      //       ),
            
      //       const SizedBox(height: 32),
            
      //       // Supervisor Section
      //       const Text(
      //         'Supervisor',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       const SizedBox(height: 16),
            
      //       TeamMemberCard(
      //         member: team.supervisor,
      //         isLarge: true,
      //       ),
            
      //       const SizedBox(height: 32),
            
      //       // Team Members Section
      //       const Text(
      //         'Team members',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       const SizedBox(height: 16),
            
      //       // Team Members Grid
      //       GridView.builder(
      //         shrinkWrap: true,
      //         physics: const NeverScrollableScrollPhysics(),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           childAspectRatio: 1.2,
      //           crossAxisSpacing: 12,
      //           mainAxisSpacing: 12,
      //         ),
      //         itemCount: team.members.length,
      //         itemBuilder: (context, index) {
      //           return TeamMemberCard(
      //             member: team.members[index],
      //             isLarge: false,
      //           );
      //         },
      //       ),
      //     ],
      //               ),
      //   )
      //   ],
      // ),
    );
  }
}
