import 'package:http/http.dart' as http;

Future<void> deleteTask({required String token , required int taskId}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/tasks/$taskId');

  try {
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Task deleted successfully.');
    } else {
      print('Failed to delete task.');
      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');
    }
    print('Body: ${response.body}');
  } catch (e) {
    print('⚠️ Exception occurred: $e');
  }
}
