import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<void> submitTask({
  required String token,
  required int taskId,
  required String description,
  required File file,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/tasks/$taskId/submit');

  final request = http.MultipartRequest('POST', url)
    ..headers['Authorization'] = 'Bearer $token'
    ..fields['description'] = description
    ..files.add(await http.MultipartFile.fromPath('file', file.path));


  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Task submitted successfully.');
      print('Response: $responseBody');
    } else {
      print('Failed to submit task.');
      print('Status: ${response.statusCode}');
      print('Error: $responseBody');
    }
  } catch (e) {
    print('Exception occurred: $e');
  }
}
