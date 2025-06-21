import 'dart:convert';

import 'package:capstone/features/auth/presentation/model_view/supervisor_user_provider/supervisor_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../data/model/report_details/report_details_model.dart';
import '../../../../data/model/report_details/report_details_response.dart';
import '../../../../data/model/report_model.dart';
class ViewReportBody extends StatefulWidget {
  final Report report;
  final String token;
  const ViewReportBody({super.key, required this.report, required this.token});

  @override
  State<ViewReportBody> createState() => _ViewReportBodyState();
}

class _ViewReportBodyState extends State<ViewReportBody> {

  ReportDetails? _reportDetails;
  bool _loading = true;

  Future<void> fetchReportDetails() async {
    final url = Uri.parse(
        'https://dev.3bhady.com/api/v1/dashboard/reports/${widget.report.id}');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final detailsResponse = ReportDetailsResponse.fromJson(data);
      setState(() {
        _reportDetails = detailsResponse.reportDetails;
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
      print("Failed to load report: ${response.body}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchReportDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : _reportDetails == null
            ? Center(child: Text('Failed to load report'))
            : Padding(padding: EdgeInsets.all(16.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Project Title', widget.report.teamName),
                const SizedBox(height: 8),
                _buildInfoRow('Supervisors', Provider
                    .of<SupervisorUserProvider>(context)
                    .user
                    ?.name ?? 'Supervisor'),
                const SizedBox(height: 8),
                _buildInfoRow('Meeting Date', widget.report.meetingDate),
                const SizedBox(height: 16),

                _sectionTitle('Topics Discussed'),
                Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(children: [
                          Expanded(child:
                          _sectionValue(_reportDetails!.topicsDiscussed),
                          )
                        ])
                    )),

                _sectionTitle('Tasks Given to Students'),
                ..._reportDetails!.tasksGivenToStudents.map(
                      (task) =>
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child:
                        ListTile(
                          title: Text(task.title),
                          subtitle: Text('Status: ${task
                              .status}, Assigned to: ${task}'),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                      ),
                ),

                _sectionTitle('Attendance'),
                ..._reportDetails!.attendance.map(
                        (attendee) =>
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child:
                          ListTile(
                            title: Text(attendee.studentName),
                            subtitle: Text('Time: ${attendee
                                .attendanceTime}'),
                            leading: Icon(
                              attendee.status == 1 ? Icons.person : Icons
                                  .person_off,
                              color: attendee.status == 1
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        )
                )
              ],
            )
        ));
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 3,
            child: Text('$label :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        Expanded(flex: 5, child: Text(value, style: TextStyle(fontSize: 15))),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
          text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _sectionValue(String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(value, style: TextStyle(fontSize: 15)),
    );
  }
}