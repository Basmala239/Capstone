// import 'package:capstone/features/projects/presentation/widgets/project_screen_cards.dart';
// import 'package:capstone/features/teams/data/models/team_model.dart';
// import 'package:capstone/features/teams/data/services/teams_service.dart';
// import 'package:capstone/widgets/background.dart';
// import 'package:flutter/material.dart';

// class ProjectScreen extends StatefulWidget {
//   const ProjectScreen({super.key});

//   @override
//   State<ProjectScreen> createState() => _ProjectScreenState();
// }

// class _ProjectScreenState extends State<ProjectScreen> {
//    List<TeamModel> allTeams = [];
//   TeamModel? myTeam;
//   List<TeamModel> filteredTeams = [];
//   String searchQuery = '';
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _loadTeams();
//   }

//   Future<void> _loadTeams() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final teams = await TeamsService.loadTeams();
//       setState(() {
//         allTeams = teams.cast<TeamModel>();
//         myTeam = allTeams.first; // Assuming the first team is the user's team
//         filteredTeams = allTeams.skip(1).toList(); // Exclude the user's team from the list
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to load teams: ${e.toString()}';
//         isLoading = false;
//       });
//     }
//   }

//   void _searchTeams(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredTeams = allTeams
//           .where((team) => 
//               team.id != myTeam?.id && // Exclude my team from search results
//               team.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Project'),
//         backgroundColor: const Color(0xFF1886CC),
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           const Background(),
//           ProjectScreenCard(
//               teams: filteredTeams,
//               isLoading: isLoading,
//               errorMessage: errorMessage,
//               onSearch: _searchTeams,
//               onRetry: _loadTeams,
//               isInTeam: myTeam == null,
//           ),
//         ],
//       ),
//     );
//   }
// }