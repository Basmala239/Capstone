import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model_view/notification_cubit.dart';
import '../../model_view/notification_state.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

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
              return ListTile(
                title: Text(notification.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(notification.description),
                trailing: IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () => context.read<NotificationCubit>().markAsRead(notification.id),
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
