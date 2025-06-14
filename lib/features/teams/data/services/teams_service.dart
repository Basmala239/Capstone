import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/teams/data/models/project_model.dart';

import '../models/team_model.dart';
// import '../models/team_member.dart';

class TeamsService {
  static List<TeamModel> getDummyTeams() {
    // Helper to generate avatar urls
    String avatarUrl(int team, int member, {bool female = false}) {
      // Alternate between men/women for variety
      final gender = female ? 'women' : 'men';
      return 'https://randomuser.me/api/portraits/$gender/${(team + member) % 99}.jpg';
    }
    return [
      TeamModel(
        id: '1',
        name: 'Team Alpha',
        project: ProjectModel(
          id: 'p1',
          name: 'Project Alpha',
          description: 'A comprehensive mobile application for managing graduation projects with advanced features for students, supervisors, and administrators.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup1',
          name: 'Ahmed Ali',
          email: 'ahmed_ali@gmail.com',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
        ),
        members: [
          TeamMemberModel(
            id: 'mem1',
            name: 'Mohamed kandil',
            email: 'ahmed_ali@gmail.com',
            role: 'Team Leader',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          TeamMemberModel(
            id: 'mem2',
            name: 'Mohamed Abdallah',
            email: 'ahmed_ali@gmail.com',
            role: 'Backend Developer',
            avatarUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
          ),
          TeamMemberModel(
            id: 'mem3',
            name: 'Mohamed ahmed',
            email: 'ahmed_ali@gmail.com',
            role: 'Backend Developer',
            avatarUrl: 'https://randomuser.me/api/portraits/men/14.jpg',
          ),
          TeamMemberModel(
            id: 'mem4',
            name: 'Mohamed khaled',
            email: 'ahmed_ali@gmail.com',
            role: 'Backend Developer',
            avatarUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
          ),
          TeamMemberModel(
            id: 'mem5',
            name: 'Mohamed hossam',
            email: 'ahmed_ali@gmail.com',
            role: 'Backend Developer',
            avatarUrl: 'https://randomuser.me/api/portraits/men/16.jpg',
          ),
        ],
        leaderId: 'mem1',
        tasks: [],
      ),
      TeamModel(
        id: '2',
        name: 'Team Beta',
        project: ProjectModel(
          id: 'p2',
          name: 'Project Beta',
          description: 'An innovative e-learning platform designed to enhance the educational experience through interactive content and real-time collaboration.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup2',
          name: 'Dr. Sarah Hassan',
          email: 'sarah.hassan@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/women/21.jpg',
        ),
        members: [
          TeamMemberModel(
            id: 'mem3',
            name: 'Omar Khaled',
            email: 'omar.khaled@gmail.com',
            role: 'Team Leader',
            avatarUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
          ),
          TeamMemberModel(
            id: 'mem4',
            name: 'Fatima Ahmed',
            email: 'fatima.ahmed@gmail.com',
            role: 'UI/UX Designer',
            avatarUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
          ),
        ],
        leaderId: 'mem3',
        tasks: [],
      ),
      TeamModel(
        id: '3',
        name: 'Team Gamma',
        project: ProjectModel(
          id: 'p3',
          name: 'Project Gamma',
          description: 'A smart IoT-based home automation system that integrates various devices for enhanced security and energy efficiency.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup3',
          name: 'Dr. Mohamed Farid',
          email: 'mohamed.farid@university.edu',
          role: 'Associate Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
        ),
        members: [
          TeamMemberModel(
            id: 'mem5',
            name: 'Youssef Ibrahim',
            email: 'youssef.ibrahim@gmail.com',
            role: 'Team Leader',
            avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          ),
        ],
        leaderId: 'mem5',
        tasks: [],
      ),
      TeamModel(
        id: '4',
        name: 'Team Delta',
        project: ProjectModel(
          id: 'p4',
          name: 'Project Delta',
          description: 'A cloud-based document collaboration tool.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup4',
          name: 'Dr. Amr Fathy',
          email: 'amr.fathy@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
        ),
        members: List.generate(6, (i) => TeamMemberModel(
          id: 'mem4${i+1}',
          name: 'Member Delta ${i+1}',
          email: 'delta${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(4, i, female: i % 2 == 1),
        )),
        leaderId: 'mem41',
        tasks: [],
      ),
      TeamModel(
        id: '5',
        name: 'Team Epsilon',
        project: ProjectModel(
          id: 'p5',
          name: 'Project Epsilon',
          description: 'A smart agriculture monitoring system.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup5',
          name: 'Dr. Mona Samir',
          email: 'mona.samir@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/women/51.jpg',
        ),
        members: List.generate(7, (i) => TeamMemberModel(
          id: 'mem5${i+1}',
          name: 'Member Epsilon ${i+1}',
          email: 'epsilon${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(5, i, female: i % 2 == 1),
        )),
        leaderId: 'mem51',
        tasks: [],
      ),
      TeamModel(
        id: '6',
        name: 'Team Zeta',
        project: ProjectModel(
          id: 'p6',
          name: 'Project Zeta',
          description: 'A real-time translation chat app.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup6',
          name: 'Dr. Hossam Nabil',
          email: 'hossam.nabil@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/men/61.jpg',
        ),
        members: List.generate(5, (i) => TeamMemberModel(
          id: 'mem6${i+1}',
          name: 'Member Zeta ${i+1}',
          email: 'zeta${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(6, i, female: i % 2 == 0),
        )),
        leaderId: 'mem61',
        tasks: [],
      ),
      TeamModel(
        id: '7',
        name: 'Team Eta',
        project: ProjectModel(
          id: 'p7',
          name: 'Project Eta',
          description: 'A blockchain-based voting system.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup7',
          name: 'Dr. Rania Fathy',
          email: 'rania.fathy@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/women/71.jpg',
        ),
        members: List.generate(8, (i) => TeamMemberModel(
          id: 'mem7${i+1}',
          name: 'Member Eta ${i+1}',
          email: 'eta${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(7, i, female: i % 2 == 0),
        )),
        leaderId: 'mem71',
        tasks: [],
      ),
      TeamModel(
        id: '8',
        name: 'Team Theta',
        project: ProjectModel(
          id: 'p8',
          name: 'Project Theta',
          description: 'A virtual reality education platform.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup8',
          name: 'Dr. Ahmed Tarek',
          email: 'ahmed.tarek@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/men/81.jpg',
        ),
        members: List.generate(6, (i) => TeamMemberModel(
          id: 'mem8${i+1}',
          name: 'Member Theta ${i+1}',
          email: 'theta${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(8, i, female: i % 2 == 1),
        )),
        leaderId: 'mem81',
        tasks: [],
      ),
      TeamModel(
        id: '9',
        name: 'Team Iota',
        project: ProjectModel(
          id: 'p9',
          name: 'Project Iota',
          description: 'A smart parking management system.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup9',
          name: 'Dr. Eman Khaled',
          email: 'eman.khaled@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/women/91.jpg',
        ),
        members: List.generate(5, (i) => TeamMemberModel(
          id: 'mem9${i+1}',
          name: 'Member Iota ${i+1}',
          email: 'iota${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(9, i, female: i % 2 == 1),
        )),
        leaderId: 'mem91',
        tasks: [],
      ),
      TeamModel(
        id: '10',
        name: 'Team Kappa',
        project: ProjectModel(
          id: 'p10',
          name: 'Project Kappa',
          description: 'A fitness and health tracking mobile app.',
        ),
        supervisor: TeamMemberModel(
          id: 'sup10',
          name: 'Dr. Salma Adel',
          email: 'salma.adel@university.edu',
          role: 'Professor',
          avatarUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
        ),
        members: List.generate(7, (i) => TeamMemberModel(
          id: 'mem10${i+1}',
          name: 'Member Kappa ${i+1}',
          email: 'kappa${i+1}@mail.com',
          role: i == 0 ? 'Team Leader' : 'Developer',
          avatarUrl: avatarUrl(10, i, female: i % 2 == 0),
        )),
        leaderId: 'mem101',
        tasks: [],
      ),
    ];
  }

  static Future<List<TeamModel>> loadTeams() async {
    // محاكاة تحميل البيانات من API
    await Future.delayed(const Duration(milliseconds: 500));
    return getDummyTeams();
  }

  static Future<bool> requestToJoinTeam(String teamId) async {
    // محاكاة إرسال طلب انضمام
    await Future.delayed(const Duration(milliseconds: 300));
    print('Request sent to join team: $teamId');
    return true;
  }
}
