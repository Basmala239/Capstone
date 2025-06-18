import 'package:capstone/features/teams/data/models/team_model.dart' show TeamModel;
import 'package:capstone/widgets/background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'team_member_card.dart';

class TeamDetails extends StatefulWidget {
  final TeamModel? myTeam;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;
  final bool tab;

  const TeamDetails({
    super.key,
    required this.myTeam,
    required this.isLoading,
    this.errorMessage,
    required this.onRetry,
    this.tab = false,
  });

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  late TeamModel? _team;

  @override
  void initState() {
    super.initState();
    _team = widget.myTeam;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: ${widget.errorMessage}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: widget.onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_team == null) {
      return const Center(child: Text('No team data available'));
    }

    final team = _team!;

    return Stack(
      children: [
        Background(),
        SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Team Header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: team.teamImageUrl != null && team.teamImageUrl!.isNotEmpty
                      ? Image.network(
                          team.teamImageUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
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
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    team.project.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (widget.tab)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _team = team.copyWith(isComplete: !team.isComplete);
                      });
                    },
                    child: Text(team.isComplete ? 'Mark Incomplete' : 'Mark Complete'),
                  ),
              ],
            ),
      
            const SizedBox(height: 24),
      
            // Project Description
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // match team card color
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Text(
                team.project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
      
            const SizedBox(height: 32),
      
            // Supervisor Section
            const Text(
              'Supervisor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
      
            TeamMemberCard(
              member: team.supervisor,
              isLarge: true,
            ),
      
            const SizedBox(height: 32),
      
            // Team Members Section
            const Text(
              'Team members',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
      
            // Team Members Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: team.members.length,
              itemBuilder: (context, index) {
                return TeamMemberCard(
                  member: team.members[index],
                  isLarge: false,
                );
              },
            ),
          ],
        ),
      )
      ],
    );
  }
}
