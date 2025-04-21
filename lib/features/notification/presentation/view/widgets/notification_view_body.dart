import 'package:capstone/features/notification/data/models/notification_model.dart';
import 'package:capstone/features/notification/presentation/view/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List notifications=NotificationModel.notifications;
    return  ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
            return notificationWidget(notifications[index]);
          }
      );
    
  }
}