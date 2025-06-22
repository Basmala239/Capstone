import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/notification_model.dart';
class NotificationRepository {
  final String token;

  NotificationRepository(this.token);

  Future<List<NotificationModel>> getNotifications({bool unreadOnly = false}) async {
    final endpoint = unreadOnly ? 'unread' : 'all';
    final response = await http.get(
      Uri.parse('https://dev.3bhady.com/api/v1/notifications/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List data = jsonData['all_notifications'] ?? [];
      return data.map((e) => NotificationModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> markAsRead(String id) async {
    await http.put(
      Uri.parse('https://dev.3bhady.com/api/v1/notifications/$id/mark-as-read'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
  }

  Future<void> markAllAsRead() async {
    await http.put(
      Uri.parse('https://dev.3bhady.com/api/v1/notifications/mark-all-as-read'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
  }
}