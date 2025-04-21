import 'package:capstone/features/notification/data/models/notification_model.dart';
import 'package:capstone/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_appbar.dart';
import 'package:capstone/widgets/empty_page.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Notification', context),
      body: Stack(
        children: [
          Background(),
          NotificationModel.notifications.isEmpty?
          emptyPage('notification'):
          NotificationViewBody()
        ],
      ),
    );
  }
}