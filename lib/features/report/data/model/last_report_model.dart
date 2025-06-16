import 'report_model.dart';

class LastReportsResponse {
  final bool status;
  final String errNum;
  final String msg;
  final List<Report> reports;

  LastReportsResponse({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.reports,
  });

  factory LastReportsResponse.fromJson(Map<String, dynamic> json) {
    return LastReportsResponse(
      status: json['status'],
      errNum: json['errNum'],
      msg: json['msg'] ?? '',
      reports: List<Report>.from(
        (json['reports'] ?? []).map((item) => Report.fromJson(item)),
      ),
    );
  }
}
