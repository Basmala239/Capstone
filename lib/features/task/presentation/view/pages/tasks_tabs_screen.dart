import 'package:capstone/features/task/data/models/task_model.dart';
import 'package:capstone/features/task/data/models/team_member_model.dart';
import 'package:capstone/features/task/data/services/task_service.dart';
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
  const TasksTabsScreen({super.key});

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
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     tooltip: 'Refresh Tasks (Reset)',
        //     onPressed: () async {
        //       await _taskService.refreshTasksInPrefs();
        //       await _loadData();
        //       if (mounted) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text('Tasks refreshed')),
        //         );
        //       }
        //     },
        //   ),
        // ],
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
      body: Stack(children: [Background(), _buildBody(),]),
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
            return _buildTasksList(tasks);
          }).toList(),
    );
  }
///[Here.number3] number3
  Widget _buildTasksList(List<TaskModel> tasks) {
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
        final hasPrev = currentStatusIdx > 1 && task.status != TaskStatus.completed;
        final hasNext = currentStatusIdx > 0 && currentStatusIdx < _tabs.length - 1 && task.status != TaskStatus.profTask && task.status != TaskStatus.inReview; 
        // disable next button for inReview status
        // final hasNext = currentStatusIdx > 0 && currentStatusIdx < _tabs.length - 1 && task.status != TaskStatus.profTask; 
        return TaskCard(
          task: task,
          teamMembers: _teamMembers,
          onSeeMore: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailsScreen(
                  task: task,
                  teamMembers: _teamMembers,
                ),
              ),
            );
          },
          bottomActions: (hasPrev || hasNext)
              ? Row(
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
                            await _loadData();
                            if (mounted) {
                              setState(() {
                                _tabController.index = currentStatusIdx - 1;
                              });
                            }
                          },
                          child: const Text('Previous'),
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
                            await _loadData();
                            if (mounted) {
                              setState(() {
                                _tabController.index = currentStatusIdx + 1;
                              });
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ),
                  ],
                )
              : null,
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
}
