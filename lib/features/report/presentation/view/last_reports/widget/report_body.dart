import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/model/last_report_model.dart';
import '../../../../data/model/report_model.dart';
import '../../view_report/view_report.dart';
class LastReportBody extends StatefulWidget {
  final String token;
  const LastReportBody({super.key, required this.token});

  @override
  State<LastReportBody> createState() => _LastReportBodyState();
}

class _LastReportBodyState extends State<LastReportBody> {
  List<Report> _reports = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    final url = Uri.parse('https://dev.3bhady.com/api/v1/dashboard/reports');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reportsResponse = LastReportsResponse.fromJson(data);
      setState(() {
        _reports = reportsResponse.reports;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      print('Failed to load reports: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  _loading
        ? Center(child: CircularProgressIndicator())
        : _reports.isEmpty
        ? Center(child: Text('No reports found.'))
        : ListView.builder(
      itemCount: _reports.length,
      itemBuilder: (context, index) {
        final report = _reports[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(report.teamName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Meeting Date: ${report.meetingDate}"),
                Text("Comment: ${report.comment}"),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.open_in_new),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewReport(report: report,)));
              },
            ),
          ),
        );
      },
    );
  }
}


