import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/meeting_model.dart';
import 'meeting_repository.dart';

class MeetingRepositoryImpl extends MeetingRepository {
  final http.Client client;
  final String token;

  MeetingRepositoryImpl(this.client, this.token);

  @override
  Future<void> createMeeting(MeetingModel meeting) async {
    final response = await client.post(
      Uri.parse('https://dev.3bhady.com/api/v1/meetings'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(meeting.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to create meeting: ${response.body}');
    }
  }
}
