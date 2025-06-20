import 'package:capstone/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/text_styles.dart';
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
  late NotificationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _cubit = NotificationCubit(NotificationRepository(widget.token));
    _cubit.fetchUnread();
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        _cubit.fetchUnread();
      } else {
        _cubit.fetchAll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.blueCC,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: ColorManager.white,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: Text('Notification',
              style: TextStyles.white24w700,),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Container(
                  color: Colors.white, // 👈 white background for TabBar
                  child: TabBar(
                    controller: _tabController,
                    labelColor: ColorManager.blueCC, // selected tab text color
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: ColorManager.blueCC, // selected tab indicator
                    tabs: const [
                      Tab(text: 'Unread'),
                      Tab(text: 'All'),
                    ],
                  ),
                ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.done_all, color: Colors.white),
                onPressed: () => _cubit.markAllAsRead(),
              ),
            ],
          ),
          body:
          Stack(
              children: [
                Background(),
                TabBarView(
                  controller: _tabController,
                  children: [
                    NotificationsViewBody(),
                  ],
                ),
              ]
          )
      ),
    );
  }
}