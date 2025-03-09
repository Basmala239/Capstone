import 'package:capstone/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:capstone/utils/widgets/background.dart';
import 'package:capstone/utils/widgets/custom_appbar.dart';
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
          NotificationViewBody()
        ],
      ),
    );
  }
}