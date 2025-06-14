import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/task/data/services/task_service.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
// import '../../data/models/team_member_model.dart';
// import '../../data/models/task_model.dart';
// import '../../data/services/task_service.dart';
import '../widgets/attachment_section.dart';
import '../widgets/assigned_user_chip.dart';

class AddOrViewTaskScreen extends StatefulWidget {
  const AddOrViewTaskScreen({super.key});

  @override
  State<AddOrViewTaskScreen> createState() => _AddOrViewTaskScreenState();
}

class _AddOrViewTaskScreenState extends State<AddOrViewTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final TaskService _taskService = TaskService();
  
  
  List<TeamMemberModel> _teamMembers = [];
  final List<TeamMemberModel> _selectedMembers = [];
  bool _isLoading = true;
  bool _isAssigning = false;

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
    _descriptionController.text = '';
    _loadTeamMembers();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _loadTeamMembers() async {
    try {
      final teamMembers = await _taskService.getAllTeamMembers();
      setState(() {
        _teamMembers = teamMembers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load team members: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _assignTask() async {
    if (_selectedMembers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one team member'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a task title'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    setState(() {
      _isAssigning = true;
    });
    try {
      // Create a new TaskModel and add it to the service
      final newTask = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dueDate: DateTime.now().add(const Duration(days: 7)),
        notes: ['Important'],
        status: TaskStatus.toDo,
        members: List<TeamMemberModel>.from(_selectedMembers),
        attachments: [],
      );
      final success = await _taskService.addTask(newTask);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? "Task added successfully" : "Failed to add task"),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
        if (success) {
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAssigning = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Title-1',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF1886CC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF1886CC),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow( 
                              color: Colors.grey.withValues(alpha: 0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Task Title',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow( 
                              color: Colors.grey.withValues(alpha: 0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Task Description',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1886CC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '14/12/2022',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1886CC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.note,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Important',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Assigned To',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1886CC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () => _showTeamMemberDrawer(context),
                          child: _selectedMembers.isEmpty
                              ? const Row(
                                  children: [
                                    Icon(Icons.add, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      'Select team members',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              : AssignedUserChip(teamMembers: _selectedMembers),
                        ),
                      ),
                      const SizedBox(height: 24),
                      AttachmentSection(
                        attachments: const [],
                        showAddButton: true,
                        onAddAttachment: () {
                          // Navigate to empty page for now
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>Scaffold(
                                body: Center(
                                  child: Column(
                                    children: [
                                      Text('Bataaaal le3b ya7bybi'),
                                      BackButton(
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isAssigning ? null : _assignTask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1886CC),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: _isAssigning
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Assigned',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  void _showTeamMemberDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Team Members',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _teamMembers.length,
                      itemBuilder: (context, index) {
                        final member = _teamMembers[index];
                        final isSelected = _selectedMembers.contains(member);
                        
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(member.avatarUrl),
                            backgroundColor: const Color(0xFF1886CC),
                          ),
                          title: Text(member.name),
                          subtitle: Text(member.role),
                          trailing: isSelected
                              ? const Icon(Icons.check, color: Color(0xFF1886CC))
                              : null,
                          onTap: () {
                            setModalState(() {
                              if (isSelected) {
                                _selectedMembers.remove(member);
                              } else {
                                _selectedMembers.add(member);
                              }
                            });
                            setState(() {}); // Update main screen
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1886CC),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Done (${_selectedMembers.length} selected)'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
