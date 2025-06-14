class ProjectModel {
  final String id;
  final String name;
  final String description;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
  });

  ProjectModel copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
