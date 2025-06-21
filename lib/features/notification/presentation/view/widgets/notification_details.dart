import 'package:flutter/material.dart';

import '../../../../../resources/text_styles.dart';
import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../data/models/notification_model.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key, required this.notification});
  final NotificationData notification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Add User', context),
        body: Stack(
          children: [
            Background(),
            _NotificationDetailsBody(notification: notification,)
          ],
        )
    );
  }
}
class _NotificationDetailsBody extends StatelessWidget {
  const _NotificationDetailsBody({required this.notification});

  final NotificationData notification;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.title, style: TextStyles.black24w600),
            SizedBox(height: 10,),
            _buildInfoRow('Type', notification.type),
            SizedBox(height: 5,),
            _buildInfoRow('Team name', notification.teamName),
            SizedBox(height: 5,),
            _buildInfoRow('Start time', notification.startTime),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description', style: TextStyles.black18W400,),
                          SizedBox(height: 5,),
                          Text(notification.description),
                          SizedBox(height: 15,),
                          Text('Message', style: TextStyles.black18W400),
                          SizedBox(height: 5,),
                          Text(notification.message)
                        ],
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 3,
            child: Text('$label :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        Expanded(flex: 5, child: Text(value, style: TextStyle(fontSize: 15))),
      ],
    );
  }
}
