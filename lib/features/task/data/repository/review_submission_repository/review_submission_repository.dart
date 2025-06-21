import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> reviewSubmission({
  required String token,
  required int submissionId,
  required String status,
  required String notes,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/submissions/$submissionId/review');

  final request = http.MultipartRequest('POST', url)
    ..headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    })
    ..fields['status'] = status
    ..fields['notes'] = notes;

  final streamedResponse = await request.send();

  final responseBody = await streamedResponse.stream.bytesToString();
  final response = jsonDecode(responseBody);
  print(responseBody);
  if (streamedResponse.statusCode == 200) {
    print('Review submitted: ${response['msg']}');
    return response['status'] == true;
  } else {
    print('Failed to submit review: $responseBody');
    return false;
  }
}

// {"status":true,"errNum":"\u062a\u0645 \u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062a\u0633\u0644\u064a\u0645 \u0628\u0646\u062c\u0627\u062d.","msg":"S001"}
// Review submitted: S001