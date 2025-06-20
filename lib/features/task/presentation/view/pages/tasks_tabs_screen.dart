import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/task/data/services/task_service.dart';
import 'package:capstone/features/task/presentation/view/pages/add_task_screen.dart';
import 'package:capstone/features/task/presentation/view/widgets/task_card.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
// import '../../data/models/task_model.dart';
// import '../../data/models/team_member_model.dart';
// import '../../data/services/task_service.dart';
// import '../widgets/task_card.dart';
import 'task_details_screen.dart';
import 'package:capstone/utils/here.dart';

class TasksTabsScreen extends StatefulWidget {
  final bool isTeamLeader;
  final bool isProfessor; 
  const TasksTabsScreen({super.key, this.isTeamLeader = true, this.isProfessor = false});

  @override
  State<TasksTabsScreen> createState() => _TasksTabsScreenState();
}

class _TasksTabsScreenState extends State<TasksTabsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TaskService _taskService = TaskService();

  List<TaskModel> _tasks = [];

  ///[Here.number6] replace List[TeamMemberModel] with task.members[TaskModel]
  List<TeamMemberModel> _teamMembers = [];
  bool _isLoading = true;
  String? _errorMessage;

  // bool _notifiedProfessor = false; //variable to track if the professor has been notified

  final List<TaskStatus> _tabs = [
    TaskStatus.profTask,
    TaskStatus.toDo,
    TaskStatus.inProgress,
    TaskStatus.inReview,
    TaskStatus.completed,
  ];

  final Map<TaskStatus, String> _tabLabels = {
    TaskStatus.profTask: 'Prof-Task',
    TaskStatus.toDo: 'To-Do',
    TaskStatus.inProgress: 'IN_Progress',
    TaskStatus.inReview: 'IN_Review',
    TaskStatus.completed: 'Completed',
  };

  @override
  void initState() {
    super.initState();
    // _taskService.refreshTasksInPrefs();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final tasks = await _taskService.getAllTasks();
      final teamMembers = await _taskService.getAllTeamMembers();

      setState(() {
        _tasks = tasks;
        _teamMembers = teamMembers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load tasks: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  List<TaskModel> _getTasksByStatus(TaskStatus status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1886CC),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(-5),
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            labelPadding: const EdgeInsets.only(right: 12),
            tabs:
                _tabs.map((status) {
                  return Tab(text: _tabLabels[status]);
                }).toList(),
          ),
        ),
      ),
      body: Stack(children: [Background(), _buildBody()]),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF1886CC)),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadData, child: const Text('Retry')),
          ],
        ),
      );
    }

    return TabBarView(
      controller: _tabController,
      children:
          _tabs.map((status) {
            final tasks = _getTasksByStatus(status);
            if (widget.isTeamLeader && status == TaskStatus.toDo) {
              return Column(
                children: [
                  _addTaskButton(context),
                  Expanded(child: _buildTasksList(tasks)),
                ],
              );
            } else if (widget.isTeamLeader && status == TaskStatus.inReview) {
              return _buildTasksList(tasks, isLeaderInReview: true);
            } else {
              return _buildTasksList(tasks);
            }
          }).toList(),
    );
  }

  Widget _addTaskButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
            if (result == true) {
              _loadData();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1886CC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          child: const Text('Add Task'),
        ),
      ),
    );
  }

///[Here.basmala1] when leader approves a task, it should go to professor's IN_Review tab
  Widget _buildTasksList(
    List<TaskModel> tasks, {
    bool isLeaderInReview = false,
  }) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final currentStatusIdx = _tabs.indexOf(task.status);
        final hasPrev = task.status == TaskStatus.inProgress;
        final hasNext =
            task.status == TaskStatus.toDo ||
            task.status == TaskStatus.inProgress;
        Widget? bottomActions;
        if (isLeaderInReview) {
          bottomActions = Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1886CC),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // Show dialog to add note
                    final controller = TextEditingController();
                    final note = await showDialog<String>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Add Note'),
                        content: TextField(
                          controller: controller,
                          minLines: 1,
                          maxLines: 5,
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
                      ),
                    );
                    if (note != null && note.isNotEmpty) {
                      // Add note to task and update
                      final updatedNotes = List<String>.from(task.notes)..add(note);
                      final prevStatus = _tabs[currentStatusIdx - 1];
                      await _taskService.updateTaskNotes(task.id, updatedNotes);
                      await _taskService.updateTaskStatus(task.id, prevStatus);
                      await _loadData();
                      if (mounted) {
                        setState(() {
                          _tabController.index = currentStatusIdx - 1;
                        });
                      }
                    }
                  },
                  child: const Text('Edit'),
                ),
              ),
              const SizedBox(width: 12),
              // Approve button for professor to send task for complete tab
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1886CC),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    await _taskService.updateTaskStatus(
                      task.id,
                      TaskStatus.completed,
                    );
                    if (mounted) {
                      setState(() {
                        _tabController.index = currentStatusIdx + 1;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Task ${task.title} completed successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    await _loadData();
                  },
                  child: const Text('Approve'),
                ),
              ),
              const SizedBox(width: 12),
            ],
          );
        } else if (hasPrev || hasNext) {
          bottomActions = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (hasPrev)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      final prevStatus = _tabs[currentStatusIdx - 1];
                      await _taskService.updateTaskStatus(task.id, prevStatus);
                      if (mounted) {
                        setState(() {
                          _tabController.index = currentStatusIdx - 1;
                        });
                      }
                      await _loadData();
                    },
                    child: const Text('Undo'),
                  ),
                ),
              if (hasPrev && hasNext) const SizedBox(width: 12),
              if (hasNext)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1886CC),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      final nextStatus = _tabs[currentStatusIdx + 1];
                      await _taskService.updateTaskStatus(task.id, nextStatus);
                      if (mounted) {
                        setState(() {
                          _tabController.index = currentStatusIdx + 1;
                        });
                      }
                      await _loadData();
                    },
                    child:
                        task.status == TaskStatus.toDo
                            ? const Text('Accept')
                            : const Text('Submit'),
                  ),
                ),
            ],
          );
        }
        return TaskCard(
          task: task,
          teamMembers: _teamMembers,
          onSeeMore: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => TaskDetailsScreen(
                      task: task,
                      teamMembers: _teamMembers,
                    ),
              ),
            );
          },
          bottomActions: bottomActions,
        );
      },
    );

    //  return GridView.builder(
    //   padding: const EdgeInsets.symmetric(vertical: 16),
    //   itemCount: tasks.length,
    //   itemBuilder: (context, index) {
    //     final task = tasks[index];
    //     return TaskCard(
    //       task: task,
    //       teamMembers: _teamMembers,
    //       onSeeMore: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => TaskDetailsScreen(
    //               task: task,
    //               teamMembers: _teamMembers,
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   },
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 16,
    //     crossAxisSpacing: 16,
    //     childAspectRatio: 0.75, // Adjust as needed
    //   ),
    // );
    /// [Here.number3]
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Notify the professor if there are new tasks in the IN_Review tab
  //   if (widget.isProfessor && !_notifiedProfessor) {
  //     final hasNewReviewTask = _tasks.any((task) => task.status == TaskStatus.inReview);
  //     if (hasNewReviewTask) {
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('You have new tasks in the IN_Review tab'),
  //             backgroundColor: Colors.blue,
  //           ),
  //         );
  //       });
  //       _notifiedProfessor = true;
  //     }
  //   }
  // }
}
