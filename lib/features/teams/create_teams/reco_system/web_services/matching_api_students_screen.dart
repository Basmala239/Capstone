import 'package:flutter/material.dart';
import 'match_result_model.dart';

class MatchingApiStudentsScreen extends StatelessWidget {
  final List<MatchUser> users;
  const MatchingApiStudentsScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Matching Students')),
      body: users.isEmpty
          ? const Center(child: Text('No matching students found.'))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(user.username[0].toUpperCase())),
                    title: Text(user.username),
                    subtitle: Text('${user.firstName} ${user.lastName}'),
                    isThreeLine: true,
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Score: ${user.similarityScore.toStringAsFixed(2)}'),
                        Wrap(
                          spacing: 6,
                          children: user.skills.map((skill) => Chip(label: Text(skill))).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
