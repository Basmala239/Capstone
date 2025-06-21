import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/notification_repository/notification_repository.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit(this.repository) : super(NotificationInitial());

  void fetch({bool unreadOnly = false}) async {
    emit(NotificationLoading());
    try {
      final list = await repository.getNotifications(unreadOnly: unreadOnly);
      emit(NotificationLoaded(list));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  void markAsRead(String id, {bool unreadOnly = false}) async {
    await repository.markAsRead(id);
    fetch(unreadOnly: unreadOnly);
  }

  void markAllAsRead({bool unreadOnly = false}) async {
    await repository.markAllAsRead();
    fetch(unreadOnly: unreadOnly);
  }
}