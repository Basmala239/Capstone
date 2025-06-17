class ProjectModel {
  final int id;
  final String name;
  final String description;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
  });

  ProjectModel copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['title'],
      description: json['description'] ?? '',
    );
  }
}
