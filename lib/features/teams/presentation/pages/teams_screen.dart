import 'package:capstone/features/teams/data/models/team_model.dart';
import 'package:capstone/features/teams/data/services/teams_service.dart';
import 'package:flutter/material.dart';
import '../widgets/my_team_tab.dart';
import '../widgets/teams_tab.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  List<TeamModel> allTeams = [];
  TeamModel? myTeam;
  List<TeamModel> filteredTeams = [];
  String searchQuery = '';
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final teams = await TeamsService.loadTeams();
      setState(() {
        allTeams = teams.cast<TeamModel>();
        myTeam = allTeams.first; // Assuming the first team is the user's team
        filteredTeams = allTeams.skip(1).toList(); // Exclude the user's team from the list
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load teams: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  void _searchTeams(String query) {
    setState(() {
      searchQuery = query;
      filteredTeams = allTeams
          .where((team) => 
              team.id != myTeam?.id && // Exclude my team from search results
              team.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _requestToJoinTeam(String teamId, String teamName) async {
    try {
      final success = await TeamsService.requestToJoinTeam(teamId);
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Request sent to join $teamName'),
            backgroundColor: const Color(0xFF2196F3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send request: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color(0xFF2196F3),
            elevation: 0,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'My Team'),
                Tab(text: 'Teams'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MyTeamTab(
              myTeam: myTeam,
              isLoading: isLoading,
              errorMessage: errorMessage,
              onRetry: _loadTeams,
            ),
            TeamsTab(
              teams: filteredTeams,
              isLoading: isLoading,
              errorMessage: errorMessage,
              onSearch: _searchTeams,
              onRequestJoin: _requestToJoinTeam,
              onRetry: _loadTeams,
            ),
          ],
        ),
      ),
    );
  }
}
