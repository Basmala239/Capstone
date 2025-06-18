class ProjectIdeaModel {
  final String id;
  final String professorName;
  final String professorAvatar;
  final String projectName;
  final String shortDescription;
  final String fullDescription;
  final List<String> requiredSkills;

  ProjectIdeaModel({
    required this.id,
    required this.professorName,
    required this.professorAvatar,
    required this.projectName,
    required this.shortDescription,
    required this.fullDescription,
    required this.requiredSkills,
  });

  // Factory constructor for creating from JSON (for future API integration)
  factory ProjectIdeaModel.fromJson(Map<String, dynamic> json) {
    return ProjectIdeaModel(
      id: json['id'],
      professorName: json['professorName'],
      professorAvatar: json['professorAvatar'],
      projectName: json['projectName'],
      shortDescription: json['shortDescription'],
      fullDescription: json['fullDescription'],
      requiredSkills: List<String>.from(json['requiredSkills']),
    );
  }

  // Method for converting to JSON (for future API integration)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professorName': professorName,
      'professorAvatar': professorAvatar,
      'projectName': projectName,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'requiredSkills': requiredSkills,
    };
  }
}
