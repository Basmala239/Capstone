import 'package:capstone/features/teams/create_teams/data/student_model.dart';
import 'package:capstone/features/teams/create_teams/presentation/pages/students_search_screen.dart';
import 'package:capstone/features/teams/create_teams/presentation/widgets/selected_member_chip.dart';
// import 'package:capstone/features/teams/create_teams/presentation/widgets/team_image_picker.dart';
import 'package:capstone/features/teams/data/models/team_model.dart';
import 'package:capstone/features/teams/data/models/project_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
// import '../../data/presentation/widgets/team_image_picker.dart';
// import '../../data/presentation/widgets/selected_member_chip.dart';
// import '../../data/data/student_model.dart';
// import '../../data/presentation/pages/students_search_screen.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  final TextEditingController _teamNameController = TextEditingController();
  // String? _teamImagePath;
  List<Student> _selectedMembers = [];

  // void _pickTeamImage() {
  //   // Simulate image picking
  //   setState(() {
  //     _teamImagePath = 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=facearea&w=120&h=120&facepad=2';
  //   });
  // }

  void _addMembers() async {
    final result = await Navigator.push<List<Student>>(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                StudentsSearchScreen(selectedMembers: _selectedMembers),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedMembers = result;
      });
    }
  }

  void _removeMember(Student student) {
    setState(() {
      _selectedMembers.removeWhere((member) => member.id == student.id);
    });
  }

  void _createTeam() {
    if (_teamNameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter team name')));
      return;
    }
    if (_selectedMembers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one member to the team'),
        ),
      );
      return;
    }

    // Simulate team creation
    final newTeam = TeamModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _teamNameController.text,
      project: ProjectModel(id: 0, name: _teamNameController.text, description: 'Project description'),
      // teamImageUrl: _teamImagePath,
      teamImageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=facearea&w=120&h=120&facepad=2',
      supervisor: TeamMemberModel(
        id: '1',
        name: 'Supervisor',
        email: 'supervisor@example.com',
        avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        role: 'supervisor',
      ),
      leaderId: _selectedMembers.isNotEmpty ? _selectedMembers.first.id : '',
      members: _selectedMembers
          .map(
            (e) => TeamMemberModel(
              id: e.id,
                  name: e.name,
                  email: e.email,
                  avatarUrl: e.profileImage,
                  role: e.id == _selectedMembers.first.id ? 'team_leader' : 'member',
                ),
              )
              .toList(),
      tasks: [],
      
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Team created successfully!')));
    Navigator.pop(context, newTeam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Create team'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team Image Picker
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=facearea&w=120&h=120&facepad=2',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                // child: TeamImagePicker(
                //   imagePath: _teamImagePath,
                //   onImagePick: _pickTeamImage,
                // ),
              ),
              const SizedBox(height: 32),
                    
              // Team Name
              const Text(
                'Team Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _teamNameController,
                decoration: InputDecoration(
                  hintText: 'Enter team name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(height: 24),
                    
              // Team Members
              const Text(
                'Team Members',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _addMembers,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                            _selectedMembers.isEmpty
                                ? Text(
                                  'Add Members',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                )
                                : Wrap(
                                  children:
                                      _selectedMembers
                                          .map(
                                            (member) => SelectedMemberChip(
                                              student: member,
                                              onRemove:
                                                  () => _removeMember(member),
                                            ),
                                          )
                                          .toList(),
                                ),
                      ),
                      Icon(Icons.search, color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
              const Spacer(),
                    
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey[400]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _createTeam,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Create',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
                    ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    super.dispose();
  }
}
