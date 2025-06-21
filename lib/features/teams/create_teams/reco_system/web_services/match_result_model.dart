class MatchUser {
  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final List<String> skills;
  final double similarityScore;

  MatchUser({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.skills,
    required this.similarityScore,
  });

  factory MatchUser.fromJson(Map<String, dynamic> json) {
    return MatchUser(
      userId: json['user_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      skills: List<String>.from(json['skills'] ?? []),
      similarityScore: (json['similarity_score'] as num).toDouble(),
    );
  }
}

class MatchResultModel {
  final List<MatchUser> matches;
  final int totalUsers;

  MatchResultModel({required this.matches, required this.totalUsers});

  factory MatchResultModel.fromJson(Map<String, dynamic> json) {
    return MatchResultModel(
      matches: (json['matches'] as List<dynamic>?)?.map((e) => MatchUser.fromJson(e)).toList() ?? [],
      totalUsers: json['total_users'] ?? 0,
    );
  }
}
