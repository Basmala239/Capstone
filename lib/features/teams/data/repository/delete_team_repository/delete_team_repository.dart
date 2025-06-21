import 'package:http/http.dart' as http;

Future<void> deleteTeam({
  required int teamId,
  required String token,
}) async {
  final uri = Uri.parse('https://dev.3bhady.com/api/v1/teams/$teamId');

  try {
    final response = await http.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Team deleted successfully.');
    } else {
      print('Failed to delete team: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Exception occurred while deleting team: $e');
  }
}
