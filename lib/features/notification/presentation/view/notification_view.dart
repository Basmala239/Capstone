import 'package:capstone/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../resources/color_manager.dart';
import '../../data/repository/notification_repository/notification_repository.dart';
import '../model_view/notification_cubit.dart';
class NotificationView extends StatefulWidget {
  final String token;
  const NotificationView({super.key, required this.token});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late NotificationCubit _unreadCubit;
  late NotificationCubit _allCubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final repo = NotificationRepository(widget.token);
    _unreadCubit = NotificationCubit(repo)..fetch(unreadOnly: true);
    _allCubit = NotificationCubit(repo)..fetch(unreadOnly: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blueCC,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Notifications", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: ColorManager.blueCC,
              tabs: const [Tab(text: 'Unread'), Tab(text: 'All')],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.white),
            onPressed: () {
              if (_tabController.index == 0) {
                _unreadCubit.markAllAsRead(unreadOnly: true);
              } else {
                _allCubit.markAllAsRead(unreadOnly: false);
              }
            },
          )
        ],
      ),
      body:Stack(
        children: [
          Background(),
          TabBarView(
            controller: _tabController,
            children: [
              BlocProvider.value(
                value: _unreadCubit,
                child: const NotificationsViewBody(unreadOnly: true),
              ),
              BlocProvider.value(
                value: _allCubit,
                child: const NotificationsViewBody(unreadOnly: false),
              ),
            ],
          ),
        ],
      )
    );
  }
}