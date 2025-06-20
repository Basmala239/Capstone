// import 'package:capstone/features/notification/data/models/notification_model.dart';
// import 'package:capstone/resources/text_styles.dart';
// import 'package:flutter/material.dart';
//
// Widget notificationWidget(NotificationModel notification){
//   return GestureDetector(
//     onTap: (){},
//     child: Container(
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           border:const  Border(bottom: BorderSide(color: Color(0xFF595959),width: 1)),
//           color: notification.read?const Color.fromARGB(101, 255, 255, 255):const Color.fromARGB(122, 121, 193, 244),
//         ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 30,
//             child:notification.image!=null ?
//             Image.network(notification.image!):
//             Text(notification.name[0].toUpperCase(),
//             style: TextStyles.blue4D18w700,),
//           ),
//           SizedBox(width: 10,),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(notification.name,
//               style: TextStyles.black18W400,),
//               Text(notification.description,
//               style: TextStyles.gray14W200,),
//             ],
//           ),
//           Spacer(),
//           Text(notification.time,
//               style: TextStyles.black18W400,)
//         ],
//       ),
//     ),
//   );
// }