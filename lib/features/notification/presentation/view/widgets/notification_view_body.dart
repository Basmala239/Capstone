import 'package:capstone/features/notification/presentation/view/widgets/notification_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../resources/text_styles.dart';
import '../../model_view/notification_cubit.dart';
import '../../model_view/notification_state.dart';

class NotificationsViewBody extends StatelessWidget {
  final bool unreadOnly;
  const NotificationsViewBody({super.key, required this.unreadOnly});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationLoaded) {
          if (state.notifications.isEmpty) {
            return const Center(child: Text("No notifications found"));
          }
          return ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return GestureDetector(
                onTap: (){
                  context.read<NotificationCubit>().markAsRead(notification.id, unreadOnly: unreadOnly);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationDetails(notification: notification.data)));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border:const  Border(bottom: BorderSide(color: Color(0xFF595959),width: 1)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child:Text(notification.data.title[0].toUpperCase(),
                          style: TextStyles.blue4D18w700,),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification.data.type,
                            style: TextStyles.black18W400,),
                          Text(notification.data.message,
                            style: TextStyles.gray14W200,
                          maxLines: 1,),
                        ],
                      ),
                      Spacer(),
                      Text("${notification.createdAt.hour}:${notification.createdAt.minute}",
                        style: TextStyles.black18W400,)
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is NotificationError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
