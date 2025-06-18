// import 'package:capstone/features/task/data/models/task_model.dart';
// import 'package:capstone/features/task/data/models/team_member_model.dart';
// import 'package:capstone/features/task/data/services/task_service.dart';
// import 'package:capstone/features/task/presentation/view/widgets/task_card.dart';
// import 'package:capstone/widgets/background.dart';
// import 'package:flutter/material.dart';
// // import '../../data/models/task_model.dart';
// // import '../../data/models/team_member_model.dart';
// // import '../../data/services/task_service.dart';
// // import '../widgets/task_card.dart';
// import 'task_details_screen.dart';
// import 'add_task_screen.dart';

// class TasksListScreen extends StatefulWidget {
//   const TasksListScreen({super.key});

//   @override
//   State<TasksListScreen> createState() => _TasksListScreenState();
// }

// class _TasksListScreenState extends State<TasksListScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   final TaskService _taskService = TaskService();

//   List<TaskModel> _tasks = [];
//   List<TeamMemberModel> _teamMembers = [];
//   bool _isLoading = true;
//   bool _isAssigning = false;
//   String? _errorMessage;

//   final List<TaskStatus> _tabs = [
//     TaskStatus.profTask,
//     TaskStatus.toDo,
//     TaskStatus.inProgress,
//     TaskStatus.inReview,
//     TaskStatus.completed,
//   ];

//   final Map<TaskStatus, String> _tabLabels = {
//     TaskStatus.profTask: 'Prof-Task',
//     TaskStatus.toDo: 'To-Do',
//     TaskStatus.inProgress: 'IN_Progress',
//     TaskStatus.inReview: 'IN_Review',
//     TaskStatus.completed: 'Completed',
//   };

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabs.length, vsync: this);
//     _loadData();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _loadData() async {
//     try {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = null;
//       });

//       final tasks = await _taskService.getAllTasks();
//       final teamMembers = await _taskService.getAllTeamMembers();

//       setState(() {
//         _tasks = tasks;
//         _teamMembers = teamMembers;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Failed to load tasks: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

//   List<TaskModel> _getTasksByStatus(TaskStatus status) {
//     return _tasks.where((task) => task.status == status).toList();
//   }

//   Future<void> _assignTask(TaskModel task, TeamMemberModel member) async {
//     setState(() {
//       _isAssigning = true;
//     });

//     try {
//       final success = await _taskService.assignTask(task.id, [member.id]);

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(success ? 'تمت الإضافة بنجاح' : 'فشلت المحاولة'),
//             backgroundColor: success ? Colors.green : Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${e.toString()}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isAssigning = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar:AppBar(
//         backgroundColor: const Color(0xFF1886CC),
//         elevation: 0,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(-5),
//           child: TabBar(
//             physics: const BouncingScrollPhysics(),
//             controller: _tabController,
//             isScrollable: true,
//             indicatorColor: Colors.white,
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white70,
//             labelStyle: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//             labelPadding: const EdgeInsets.only(right: 12),
//             tabs:
//                 _tabs.map((status) {
//                   return Tab(text: _tabLabels[status]);
//                 }).toList(),
//           ),
//         ),
//       ),
//       // appBar: AppBar(
//       //   title: const Text(
//       //     'Tasks',
//       //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//       //   ),
//       //   backgroundColor: const Color(0xFF1886CC),
//       //   elevation: 0,
//       //   leading: IconButton(
//       //     icon: const Icon(Icons.arrow_back, color: Colors.white),
//       //     onPressed: () => Navigator.pop(context),
//       //   ),
//       //   actions: [
//       //     Padding(
//       //       padding: const EdgeInsets.only(right: 16),
//       //       child: ElevatedButton(
//       //         onPressed: () async {
//       //           final result = await Navigator.push(
//       //             context,
//       //             MaterialPageRoute(
//       //               builder: (context) => const AddOrViewTaskScreen(),
//       //             ),
//       //           );
//       //           if (result == true) {
//       //             _loadData();
//       //           }
//       //         },
//       //         style: ElevatedButton.styleFrom(
//       //           backgroundColor: Colors.white,
//       //           foregroundColor: const Color(0xFF1886CC),
//       //           shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(8),
//       //           ),
//       //           padding: const EdgeInsets.symmetric(
//       //             horizontal: 16,
//       //             vertical: 8,
//       //           ),
//       //         ),
//       //         child: const Text('Add Task'),
//       //       ),
//       //     ),
//       //   ],
//       //   bottom: TabBar(
//       //     controller: _tabController,
//       //     isScrollable: true,
//       //     indicatorColor: Colors.white,
//       //     labelColor: Colors.white,
//       //     unselectedLabelColor: Colors.white70,
//       //     labelStyle: const TextStyle(
//       //       fontSize: 12,
//       //       fontWeight: FontWeight.w500,
//       //     ),
//       //     tabs:
//       //         _tabs.map((status) {
//       //           return Tab(text: _tabLabels[status]);
//       //         }).toList(),
//       //   ),
//       // ),
//       body: Stack(
//         children: [
//           const Background(),
//           _buildBody(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBody() {
//     if (_isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(color: Color(0xFF1886CC)),
//       );
//     }

//     if (_errorMessage != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _errorMessage!,
//               style: const TextStyle(color: Colors.red),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(onPressed: _loadData, child: const Text('Retry')),
//           ],
//         ),
//       );
//     }

//     return TabBarView(
//       controller: _tabController,
//       children:
//           _tabs.map((status) {
//             final tasks = _getTasksByStatus(status);
//             return Column(
//               children: [
//                 if (status == TaskStatus.toDo) 
//                 _addTaskButton(context),
//                 Expanded(child: _buildTasksList(tasks)),
//               ],
//             );
//           }).toList(),
//     );
//   }

//   Widget _buildTasksList(List<TaskModel> tasks) {
//     if (tasks.isEmpty) {
//       return const Center(
//         child: Text(
//           'No tasks found',
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         final task = tasks[index];
//         return TaskCard(
//           task: task,
//           teamMembers: _teamMembers,
//           showAssignButton: true,
//           onAssign: () => _showAssignDialog(context, task),
//           onSeeMore: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder:
//                     (context) => TaskDetailsScreen(
//                       task: task,
//                       teamMembers: _teamMembers,
//                     ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showAssignDialog(BuildContext context, TaskModel task) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Assign Task To:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               if (_isAssigning)
//                 const Center(
//                   child: CircularProgressIndicator(color: Color(0xFF1886CC)),
//                 )
//               else
//                 ..._teamMembers.map((member) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(member.avatarUrl),
//                       backgroundColor: const Color(0xFF1886CC),
//                     ),
//                     title: Text(member.name),
//                     subtitle: Text(member.role),
//                     onTap: () {
//                       Navigator.pop(context);
//                       _assignTask(task, member);
//                     },
//                   );
//                 }).toList(),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _addTaskButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//       child: SizedBox(
//         width: double.infinity,
//         child: ElevatedButton(
//           onPressed: () async {
//             final result = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const AddOrViewTaskScreen(),
//               ),
//             );
//             if (result == true) {
//               _loadData();
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: const Color(0xFF1886CC),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           ),
//           child: const Text('Add Task'),
//         ),
//       ),
//     );
    
//   }

// }
