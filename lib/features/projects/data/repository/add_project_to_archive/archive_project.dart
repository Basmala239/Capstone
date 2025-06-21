import 'package:http/http.dart' as http;

Future<void> archiveProject({
  required int projectId,
  required String token,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/projects/$projectId');

  try {
    final request = http.MultipartRequest('PUT', uri)
      ..headers['Authorization'] = 'Bearer $token'
      ..fields['project_status'] = 'archived';

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Project archived successfully.');
    } else {
      print('Failed to archive project: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');
    }
  } catch (e) {
    print('Error archiving project: $e');
  }
}
