import 'project_idea_model.dart';

class ProjectIdeasService {
  // Singleton pattern
  static final ProjectIdeasService _instance = ProjectIdeasService._internal();
  factory ProjectIdeasService() => _instance;
  ProjectIdeasService._internal();

  // Dummy data
  final List<ProjectIdeaModel> _projectIdeas = [
    ProjectIdeaModel(
      id: "1",
      professorName: "Dr. Ahmed El-Sayed",
      professorAvatar: "https://randomuser.me/api/portraits/men/32.jpg",
      projectName: "Smart Attendance System",
      shortDescription: "A system for automated student attendance using face recognition.",
      fullDescription:
          "This project aims to develop a smart attendance system that leverages facial recognition technology to automate the process of recording student attendance in classrooms. The system will utilize a camera to capture student faces, match them against a database, and mark attendance automatically. Students will learn about computer vision, machine learning, and database integration. The project will also cover security aspects and real-time data processing, providing a comprehensive experience in building intelligent systems for educational institutions.This project aims to develop a smart attendance system that leverages facial recognition technology to automate the process of recording student attendance in classrooms. The system will utilize a camera to capture student faces, match them against a database, and mark attendance automatically. Students will learn about computer vision, machine learning, and database integration. The project will also cover security aspects and real-time data processing, providing a comprehensive experience in building intelligent systems for educational institutions.This project aims to develop a smart attendance system that leverages facial recognition technology to automate the process of recording student attendance in classrooms. The system will utilize a camera to capture student faces, match them against a database, and mark attendance automatically. Students will learn about computer vision, machine learning, and database integration. The project will also cover security aspects and real-time data processing, providing a comprehensive experience in building intelligent systems for educational institutions.",
      requiredSkills: ["Data Analyst", "React", "Node.js", "Database Design"],
    ),
    ProjectIdeaModel(
      id: "2",
      professorName: "Prof. Mona Khaled",
      professorAvatar: "https://randomuser.me/api/portraits/women/44.jpg",
      projectName: "Cross-Platform Health Tracker",
      shortDescription: "A mobile app for tracking health metrics and habits.",
      fullDescription:
          "This innovative project focuses on developing a cross-platform mobile application that helps users monitor their daily health metrics, such as steps, calories, water intake, and sleep patterns. The app will feature interactive dashboards, personalized recommendations, and integration with wearable devices. Students will gain hands-on experience in mobile development, UI/UX design, and API integration, as well as learn about data visualization and user engagement strategies.",
      requiredSkills: ["Mobile Development", "UI/UX Design", "API Integration"],
    ),
    ProjectIdeaModel(
      id: "3",
      professorName: "Dr. Youssef Nabil",
      professorAvatar: "https://randomuser.me/api/portraits/men/65.jpg",
      projectName: "AI-Based Course Recommendation",
      shortDescription: "A recommendation system for university courses using AI.",
      fullDescription:
          "This project involves building an AI-powered recommendation system that suggests university courses to students based on their interests, academic history, and career goals. The system will analyze large datasets, apply machine learning algorithms, and provide personalized course suggestions. Students will explore data science, predictive modeling, and recommendation engines, gaining valuable skills in artificial intelligence and educational technology.",
      requiredSkills: ["Machine Learning", "Python", "Data Science", "Statistics"],
    ),
    ProjectIdeaModel(
      id: "4",
      professorName: "Prof. Salma Hassan",
      professorAvatar: "https://randomuser.me/api/portraits/women/68.jpg",
      projectName: "Secure File Sharing Platform",
      shortDescription: "A platform for secure file sharing and collaboration.",
      fullDescription:
          "This cybersecurity project focuses on developing a secure file sharing and collaboration platform for organizations. The platform will implement advanced encryption techniques, user authentication, and access control to ensure data privacy and protection. Students will learn about network security, encryption algorithms, and vulnerability assessment, while building a real-world solution for secure digital collaboration.",
      requiredSkills: ["Cybersecurity", "Network Security", "Encryption", "Penetration Testing"],
    ),
  ];

  // Get all project ideas
  List<ProjectIdeaModel> getAllProjectIdeas() {
    return List.unmodifiable(_projectIdeas);
  }

  // Get project idea by ID
  ProjectIdeaModel? getProjectIdeaById(String id) {
    try {
      return _projectIdeas.firstWhere((project) => project.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search project ideas by name or professor name
  List<ProjectIdeaModel> searchProjectIdeas(String query) {
    if (query.isEmpty) {
      return getAllProjectIdeas();
    }
    
    return _projectIdeas.where((project) =>
        project.projectName.toLowerCase().contains(query.toLowerCase()) ||
        project.professorName.toLowerCase().contains(query.toLowerCase()) ||
        project.shortDescription.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Future method for API integration
  Future<List<ProjectIdeaModel>> fetchProjectIdeasFromAPI() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    return getAllProjectIdeas();
  }
}
