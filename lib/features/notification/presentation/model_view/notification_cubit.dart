import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/notification_repository/notification_repository.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit(this.repository) : super(NotificationInitial());

  void fetchUnread() async {
    emit(NotificationLoading());
    try {
      final list = await repository.getUnreadNotifications();
      emit(NotificationLoaded(list));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  void fetchAll() async {
    emit(NotificationLoading());
    try {
      final list = await repository.getAllNotifications();
      emit(NotificationLoaded(list));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  void markAsRead(String id) async {
    await repository.markAsRead(id);
    fetchUnread();
  }

  void markAllAsRead() async {
    await repository.markAllAsRead();
    fetchUnread();
  }
}