import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> deleteProject({
  required String token,
  required int projectId,
}) async {
  final url = Uri.parse('https://dev.3bhady.com/api/v1/projects/$projectId');

  final response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
  );
  print(response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['status'] == true;
  } else {
    print('❌ Failed to delete project: ${response.statusCode}');
    print(response.body);
    return false;
  }
}
// {"status":false,"errNum":"E003","msg":"Unauthorized to delete projects. Only Admin can delete."}

// {"status":true,"errNum":"S000","msg":"Project deleted successfully."}