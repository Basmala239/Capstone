import 'package:capstone/features/report/data/model/report_details/report_details_model.dart';

class ReportDetailsResponse {
  final bool status;
  final String errNum;
  final String msg;
  final ReportDetails reportDetails;

  ReportDetailsResponse({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.reportDetails,
  });

  factory ReportDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ReportDetailsResponse(
      status: json['status'],
      errNum: json['errNum'],
      msg: json['msg'] ?? '',
      reportDetails: ReportDetails.fromJson(json['reportDetails']),
    );
  }
}
