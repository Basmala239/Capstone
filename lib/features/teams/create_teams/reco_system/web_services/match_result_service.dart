import 'dart:convert';
import 'package:http/http.dart' as http;
import 'match_result_model.dart';

class MatchResultService {
  static const String apiUrl = 'https://acad-manager-production.up.railway.app/v1/team/recommend-for-us';
  static const String apiToken = '';

  static Future<MatchResultModel> fetchMatches(List<String> tools) async {
    final query = tools.isNotEmpty ? '?tools=${tools.join(',')}' : '';
    final response = await http.get(
      Uri.parse(apiUrl + query),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiToken',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MatchResultModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch matches: \n${response.body}');
    }
  }
}
