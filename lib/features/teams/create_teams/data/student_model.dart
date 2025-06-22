class Student {
  final String id;
  final String name;
  final String track;
  final String gender;
  final String profileImage;
  final bool isInvited;
  final String avatarUrl;
  final String email;

  Student({
    required this.id,
    required this.name,
    required this.track,
    required this.gender,
    required this.profileImage,
    this.isInvited = false,
    required this.avatarUrl,
    required this.email,
  });

  Student copyWith({
    String? id,
    String? name,
    String? track,
    String? gender,
    String? profileImage,
    bool? isInvited,
    String? avatarUrl,
    String? email,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      track: track ?? this.track,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
      isInvited: isInvited ?? this.isInvited,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }

}