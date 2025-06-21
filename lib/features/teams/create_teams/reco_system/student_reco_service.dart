import 'student_reco_model.dart';

class StudentRecoService {
  static final List<StudentRecoModel> students = [
    StudentRecoModel(
      id: '1',
      name: 'Mohamed Abdullah',
      email: 'mohamed.abdullah@email.com',
      tools: ['Flutter', 'Dart', 'Firebase'],
    ),
    StudentRecoModel(
      id: '2',
      name: 'Sara Mohamed',
      email: 'sara.mohamed@email.com',
      tools: ['React', 'JavaScript', 'CSS'],
    ),
    StudentRecoModel(
      id: '3',
      name: 'Ahmed Hassan',
      email: 'ahmed.hassan@email.com',
      tools: ['Node.js', 'MongoDB', 'Express'],
    ),
    StudentRecoModel(
      id: '4',
      name: 'Fatma Ahmed',
      email: 'fatma.ahmed@email.com',
      tools: ['Figma', 'Adobe XD', 'UI/UX'],
    ),
    StudentRecoModel(
      id: '5',
      name: 'Omar Ali',
      email: 'omar.ali@email.com',
      tools: ['Python', 'ML', 'Pandas'],
    ),
    StudentRecoModel(
      id: '6',
      name: 'Nour Hassan',
      email: 'nour.hassan@email.com',
      tools: ['Flutter', 'Firebase', 'UI/UX'],
    ),
  ];

  static List<StudentRecoModel> matchStudentsByTools(List<String> inputTools) {
    return students.where((student) =>
      student.tools.any((tool) => inputTools.map((e) => e.toLowerCase()).contains(tool.toLowerCase()))
    ).toList();
  }
}
