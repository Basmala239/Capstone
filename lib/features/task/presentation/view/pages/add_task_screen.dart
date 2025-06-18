
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
import 'package:capstone/features/task/presentation/view/pages/notes_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final TaskService _taskService = TaskService();

  List<TeamMemberModel> _teamMembers = [];
  final List<TeamMemberModel> _selectedMembers = [];
  final List<String> _notes = [];
  final List<AttachmentModel> _attachments = [];
  bool _isLoading = true;
  bool _isAssigning = false;
  DateTime? _selectedDueDate;

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
  //Validate the task details and assign the task
  Future<void> _assignTask() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a task title'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a task description'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (_selectedDueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a due date'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (_selectedMembers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one team member'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isAssigning = true;
    });
    //Assign the task
    // Here you would typically call your backend service to assign the task
    try {
      // Create a new task model with the provided details
      final newTask = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dueDate: _selectedDueDate!,
        createdAt: DateTime.now(),
        notes: List<String>.from(_notes),
        status: TaskStatus.toDo,
        members: List<TeamMemberModel>.from(_selectedMembers),
        attachments: List<AttachmentModel>.from(_attachments),
      );
      // Call the service to add the task
      final success = await _taskService.addTask(newTask);
      // Show a success or failure message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success ? "Task added successfully" : "Failed to add task",
            ),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
        // If successful, pop the screen and return true
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
          'Add Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
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
                child: CircularProgressIndicator(color: Color(0xFF1886CC)),
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
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: _selectedDueDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365)),
                              );
                              if (picked != null) {
                                setState(() {
                                  _selectedDueDate = picked;
                                });
                              }
                            },
                            child: Container(
                              height: 55,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1886CC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _selectedDueDate == null
                                        ? 'Select Due Date'
                                        : '${_selectedDueDate!.day}/${_selectedDueDate!.month}/${_selectedDueDate!.year}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 55, 
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1886CC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final note = await showDialog<String>(
                                  context: context,
                                  builder: (context) {
                                    final controller = TextEditingController();
                                    return AlertDialog(
                                      title: const Text('Add Note'),
                                      content: TextField(
                                        controller: controller,
                                        minLines: 1,
                                        maxLines: 7,
                                        decoration: const InputDecoration(hintText: 'Enter note'),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () => Navigator.pop(context, controller.text.trim()),
                                          child: const Text('Add'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (note != null && note.isNotEmpty) {
                                  setState(() {
                                    _notes.add(note);
                                  });
                                }
                              },
                              child: Row(      
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,                        
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.note, color: Colors.white, size: 16),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Notes',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_notes.isNotEmpty)
                                    IconButton(
                                      icon: const Icon(Icons.open_in_new, color: Colors.white, size: 18),
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => NotesScreen(
                                              notes: _notes.map((n) => Note(
                                                content: n,
                                                author: 'You',
                                                date: DateTime.now(),
                                              )).toList(),
                                              isTeamLeader: true,
                                            ),
                                          ),
                                        );
                                        if (result is List<Note>) {
                                          setState(() {
                                            _notes.clear();
                                            _notes.addAll(result.map((e) => e.content));
                                          });
                                        }
                                      },
                                    ),
                                ],
                              ),
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
                        child:
                            _selectedMembers.isEmpty
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
                                : AssignedUserChip(
                                  teamMembers: _selectedMembers,
                                ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AttachmentSection(
                      attachments: _attachments,
                      showAddButton: true,
                      onAddAttachment: () async {
                        final result = await AttachmentSection.showAddAttachmentDialog(context);
                        if (result != null) {
                          setState(() {
                            _attachments.add(result);
                          });
                        }
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
                        child:
                            _isAssigning
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          trailing:
                              isSelected
                                  ? const Icon(
                                    Icons.check,
                                    color: Color(0xFF1886CC),
                                  )
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
