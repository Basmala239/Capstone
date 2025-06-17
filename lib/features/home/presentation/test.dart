// import 'package:flutter/material.dart';
// import '../data/network/dashboard_stats_repository/dashboard_stats_repository.dart';
//
// class DashboardReportsScreen extends StatelessWidget {
//   final String token;
//   const DashboardReportsScreen({super.key, required this.token});
//
//   @override
//   Widget build(BuildContext context) {
//     // fetchProjectProgress(token);
//     // fetchDashboardReports(token);
//     // fetchDashboardMembers(token);
//     // fetchTopStudentsByTasks(token),
//     fetchDashboardStats(token);
//     return Scaffold(
//       appBar: AppBar(title: const Text('📈 Dashboard Reports')),
//       body: Text('body')
//     );
//   }
// }


//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';
//
// class DashboardStatsView extends StatelessWidget {
//   final String token;
//   const DashboardStatsView({super.key, required this.token});
//
//   Future<Map<String, dynamic>> fetchDashboardStatsOnly(String token) async {
//     final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/stats');
//
//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Accept-Encoding': 'gzip, deflate, br',
//         'Connection': 'keep-alive',
//         'Accept': 'application/json',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['status'] == true && data.containsKey('dashboardStats')) {
//         return data['dashboardStats'];
//       } else {
//         throw Exception('Invalid response structure.');
//       }
//     } else {
//       throw Exception('Failed to load dashboard stats. Status: ${response.statusCode}');
//     }
//   }
//
//   Color _getColorForStatus(String status) {
//     switch (status) {
//       case 'To-Do':
//         return Colors.orange;
//       case 'In Progress':
//         return Colors.blue;
//       case 'Pending':
//         return Colors.purple;
//       case 'Done':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Widget _buildInfoTile(String title, String value) {
//     return Card(
//       child: ListTile(
//         leading: const Icon(Icons.info_outline),
//         title: Text(title),
//         trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('📊 Dashboard Stats')),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: fetchDashboardStatsOnly(token),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('❌ ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No stats available.'));
//           }
//
//           final stats = snapshot.data!;
//           final tasksByStatus = stats['tasksByStatus'] as Map<String, dynamic>;
//           final meetingAttendance = stats['meetingAttendancePerTeam'] as List<dynamic>;
//
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildInfoTile("User Type", stats['userType']),
//                 _buildInfoTile("Total Teams", stats['numberOfTeams'].toString()),
//                 _buildInfoTile("Total Tasks", stats['totalTasks'].toString()),
//                 _buildInfoTile("Total Members", stats['totalMembers'].toString()),
//
//                 const SizedBox(height: 24),
//                 const Text("📌 Tasks by Status", style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   height: 250,
//                   child: PieChart(
//                     PieChartData(
//                       sectionsSpace: 2,
//                       centerSpaceRadius: 40,
//                       sections: tasksByStatus.entries
//                           .where((e) => e.value > 0)
//                           .map((e) => PieChartSectionData(
//                         color: _getColorForStatus(e.key),
//                         value: double.tryParse(e.value.toString()) ?? 0,
//                         title: '${e.key}\n${e.value}',
//                         radius: 60,
//                         titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
//                       ))
//                           .toList(),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//                 const Text("👥 Meeting Attendance", style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 ...meetingAttendance.map((e) => Card(
//                   child: ListTile(
//                     title: Text(e['meeting_title']),
//                     subtitle: Text('Team: ${e['team_name']}'),
//                     trailing: Text('Count: ${e['attendance_count']}'),
//                   ),
//                 )),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // Fetch function
// Future<List<Map<String, dynamic>>> fetchDashboardTasks(String token) async {
//   final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/tasks');
//
//   final response = await http.get(
//     url,
//     headers: {
//       'Authorization': 'Bearer $token',
//       'Accept': 'application/json',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Connection': 'keep-alive',
//     },
//   );
//
//   print(response.body);
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     if (json['status'] == true && json['tasks'] is List) {
//       return List<Map<String, dynamic>>.from(json['tasks']);
//     } else {
//       throw Exception('Unexpected response format');
//     }
//   } else {
//     throw Exception('Failed to fetch tasks: ${response.statusCode}');
//   }
// }
//
// // Main Screen
// class DashboardTasksScreen extends StatefulWidget {
//   final String token;
//   const DashboardTasksScreen({super.key, required this.token});
//
//   @override
//   State<DashboardTasksScreen> createState() => _DashboardTasksScreenState();
// }
//
// class _DashboardTasksScreenState extends State<DashboardTasksScreen> {
//   late Future<List<Map<String, dynamic>>> _tasksFuture;
//   String _selectedStatus = 'All';
//
//   @override
//   void initState() {
//     super.initState();
//     _tasksFuture = fetchDashboardTasks(widget.token);
//   }
//
//   Future<void> _refresh() async {
//     setState(() {
//       _tasksFuture = fetchDashboardTasks(widget.token);
//     });
//   }
//
//   List<Map<String, dynamic>> _filterTasks(List<Map<String, dynamic>> tasks) {
//     if (_selectedStatus == 'All') return tasks;
//     return tasks.where((task) => task['status'] == _selectedStatus).toList();
//   }
//
//   Color _statusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'to-do':
//         return Colors.orange;
//       case 'in progress':
//         return Colors.blue;
//       case 'pending':
//         return Colors.amber;
//       case 'done':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('📋 Dashboard Tasks')),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: DropdownButtonFormField<String>(
//               value: _selectedStatus,
//               decoration: const InputDecoration(
//                 labelText: 'Filter by Status',
//                 border: OutlineInputBorder(),
//               ),
//               items: ['All', 'To-Do', 'In Progress', 'Pending', 'Done']
//                   .map((status) => DropdownMenuItem(value: status, child: Text(status)))
//                   .toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   setState(() => _selectedStatus = value);
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Map<String, dynamic>>>(
//               future: _tasksFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('❌ ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No tasks available.'));
//                 }
//
//                 final filteredTasks = _filterTasks(snapshot.data!);
//
//                 return RefreshIndicator(
//                   onRefresh: _refresh,
//                   child: ListView.separated(
//                     padding: const EdgeInsets.all(12),
//                     itemCount: filteredTasks.length,
//                     separatorBuilder: (_, __) => const Divider(),
//                     itemBuilder: (context, index) {
//                       final task = filteredTasks[index];
//                       final status = task['status'] ?? '';
//                       return ListTile(
//                         contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                         leading: CircleAvatar(
//                           backgroundColor: _statusColor(status),
//                           child: Text('${index + 1}'),
//                         ),
//                         title: Text(task['title'] ?? 'No Title'),
//                         subtitle: Text(task['description'] ?? ''),
//                         trailing: Text(
//                           status,
//                           style: TextStyle(color: _statusColor(status)),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
