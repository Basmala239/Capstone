import 'student_model.dart';

class StudentService {
  static final List<Student> _allStudents = [
    Student(
      id: '1',
      name: 'Mohamed Abdullah',
      track: 'Frontend Developer',
      gender: 'Male',
      profileImage: 'https://randomuser.me/api/portraits/men/11.jpg',
      avatarUrl: '',
      email: 'mohamed.abdullah@email.com',
    ),
    Student(
      id: '2',
      name: 'Ahmed Hassan',
      track: 'Backend Developer',
      gender: 'Male',
      profileImage: 'https://randomuser.me/api/portraits/men/12.jpg',
      avatarUrl: '',
      email: 'ahmed.hassan@email.com',
    ),
    Student(
      id: '3',
      name: 'Sara Mohamed',
      track: 'Flutter Developer',
      gender: 'Female',
      profileImage: 'https://randomuser.me/api/portraits/women/13.jpg',
      avatarUrl: '',
      email: 'sara.mohamed@email.com',
    ),
    Student(
      id: '4',
      name: 'Omar Ali',
      track: 'ML Engineer',
      gender: 'Male',
      profileImage: 'https://randomuser.me/api/portraits/men/14.jpg',
      avatarUrl: '',
      email: 'omar.ali@email.com',
    ),
    Student(
      id: '5',
      name: 'Fatma Ahmed',
      track: 'UI/UX Designer',
      gender: 'Female',
      profileImage: 'https://randomuser.me/api/portraits/women/15.jpg',
      avatarUrl: '',
      email: 'fatma.ahmed@email.com',
    ),
    Student(
      id: '6',
      name: 'Khaled Mahmoud',
      track: 'Security Engineer',
      gender: 'Male',
      profileImage: 'https://randomuser.me/api/portraits/men/16.jpg',
      avatarUrl: '',
      email: 'khaled.mahmoud@email.com',
    ),
    Student(
      id: '7',
      name: 'Nour Hassan',
      track: 'Frontend Developer',
      gender: 'Female',
      profileImage: 'https://randomuser.me/api/portraits/women/17.jpg',
      avatarUrl: '',
      email: 'nour.hassan@email.com',
    ),
    Student(
      id: '8',
      name: 'Youssef Omar',
      track: 'Backend Developer',
      gender: 'Male',
      profileImage: 'https://randomuser.me/api/portraits/men/18.jpg',
      avatarUrl: '',
      email: 'youssef.omar@email.com',
    ),
  ];

  static List<Student> getAllStudents() {
    return List.from(_allStudents);
  }

  static List<Student> searchStudents({
    String? query,
    List<String>? genderFilters,
    List<String>? trackFilters,
  }) {
    List<Student> filteredStudents = List.from(_allStudents);

    // Apply search query
    if (query != null && query.isNotEmpty) {
      filteredStudents = filteredStudents
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    // Apply gender filters
    if (genderFilters != null && genderFilters.isNotEmpty) {
      filteredStudents = filteredStudents
          .where((student) => genderFilters.contains(student.gender))
          .toList();
    }

    // Apply track filters
    if (trackFilters != null && trackFilters.isNotEmpty) {
      filteredStudents = filteredStudents
          .where((student) => trackFilters.any((track) =>
              student.track.toLowerCase().contains(track.toLowerCase())))
          .toList();
    }

    return filteredStudents;
  }

  static void updateStudentInviteStatus(String studentId, bool isInvited) {
    final index = _allStudents.indexWhere((student) => student.id == studentId);
    if (index != -1) {
      _allStudents[index] = _allStudents[index].copyWith(isInvited: isInvited);
    }
  }
}
