import 'package:capstone/features/teams/data/models/team_model.dart';
import 'package:capstone/features/teams/presentation/pages/team_details_screen.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
// import '../pages/team_details_page.dart';

class TeamsTab extends StatefulWidget {
  final List<TeamModel> teams;
  final bool isLoading;
  final String? errorMessage;
  final Function(String) onSearch;
  final Function(String, String) onRequestJoin;
  final VoidCallback onRetry;
  final bool isInTeam;

  const TeamsTab({
    super.key,
    required this.teams,
    required this.isLoading,
    this.errorMessage,
    required this.onSearch,
    required this.onRequestJoin,
    required this.onRetry,
    this.isInTeam = false,
  });

  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  String? _requestedTeamId;
  final Map<String, int> _requestCancelCount = {};

  @override
  Widget build(BuildContext context) {
    final teams = widget.teams;
    final isLoading = widget.isLoading;
    final errorMessage = widget.errorMessage;
    final onSearch = widget.onSearch;
    final onRequestJoin = widget.onRequestJoin;
    final onRetry = widget.onRetry;
    final isInTeam = widget.isInTeam;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: $errorMessage',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      );
    }

    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      // child: SearchBar(
                      //   onChanged: onSearch,
                      //   hintText: 'Search teams...'
                      // ),
                      child: TextFormField(
                        onChanged: onSearch,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Teams List
            Expanded(
              child:
                  isInTeam
                      ? const Center(
                          child: Text(
                            'You are already in a team.',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : teams.where((team) => !team.isComplete).isEmpty
                        ? const Center(
                          child: Text(
                            'No teams found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                        : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        //filter teams that are not complete
                        itemCount: teams.where((team) => !team.isComplete).length,
                        // itemCount: teams.length,
                        itemBuilder: (context, index) {
                        final filteredTeams = teams.where((team) => !team.isComplete).toList();
                          // final filteredTeams = teams.toList();
                          final team = filteredTeams[index];
                          final isRequested = _requestedTeamId == team.id;
                          final count = _requestCancelCount[team.id] ?? 0;
                          final requestChances = 2;
                          final isDisabled = count >= requestChances * 2 || (_requestedTeamId != null && _requestedTeamId != team.id);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          TeamDetailsScreen(team: team),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child:
                                            team.teamImageUrl != null &&
                                                    team
                                                        .teamImageUrl!
                                                        .isNotEmpty
                                                ? Image.network(
                                                  team.teamImageUrl!,
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => Container(
                                                        width: 60,
                                                        height: 60,
                                                        color: Colors.grey[200],
                                                        child: const Icon(
                                                          Icons.groups,
                                                          size: 30,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                )
                                                : Container(
                                                  width: 60,
                                                  height: 60,
                                                  color: Colors.grey[200],
                                                  child: const Icon(
                                                    Icons.groups,
                                                    size: 30,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              team.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '${team.leader.name} (Leader)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'project description',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[50],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      team.project.description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        height: 1.4,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    child: isRequested
                                        ? ElevatedButton(
                                            onPressed: isDisabled
                                                ? null
                                                : () {
                                                    setState(() {
                                                      _requestedTeamId = null;
                                                      _requestCancelCount[team.id] = (_requestCancelCount[team.id] ?? 0) + 1;
                                                    });
                                                  },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        : ElevatedButton(
                                            onPressed: isDisabled
                                                ? null
                                                : () {
                                                    setState(() {
                                                      _requestedTeamId = team.id;
                                                      _requestCancelCount[team.id] = (_requestCancelCount[team.id] ?? 0) + 1;
                                                    });
                                                    onRequestJoin(team.id, team.name);
                                                  },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xFF2196F3),
                                              foregroundColor: Colors.white,
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              'Request',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ],
    );
  }
}
