import 'package:capstone/features/notification/data/models/notification_model.dart';
import 'package:flutter/material.dart';

Widget notificationWidget(NotificationModel notification){
  return GestureDetector(
    onTap: (){},
    child: Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          border:const  Border(bottom: BorderSide(color: Color(0xFF595959),width: 1)),
          color: notification.read?Colors.white:const Color.fromARGB(255, 121, 192, 244),
        ),
      child: Row(
        children: [
          Image.asset(notification.image),
          Column(
            children: [
              Text(notification.name),
              Text(notification.description)
            ],
          ),
          //Text(notification.date)
        ],
      ),
    ),
  );
}