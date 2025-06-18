import 'package:capstone/features/auth/presentation/view/login_view/login_view.dart';
import 'package:capstone/features/task/presentation/view/pages/tasks_list_screen.dart';
import 'package:capstone/features/task/presentation/view/pages/tasks_tabs_screen.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../resources/text_styles.dart';
import '../../../../archive/presentation/model_view/project_cubit.dart';
import '../../../../archive/presentation/view/archive_view.dart';
import '../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../profile/presentation/view/profile_view/profile_view.dart';
import '../../../../projects/presentation/pages/project_ideas_screen.dart';
import '../../../../report/presentation/view/last_reports/report_view.dart';
import '../../../../schedule/presentation/view/schedule_view.dart';
import '../../../../teams/presentation/pages/teams_tabs_screen.dart';
import '../../../../user_management/presentation/all_users/view/all_users_view.dart';
import '../../../data/model/list_item.dart';
import '../../../data/network/logout_api.dart';

class NavigationDrawerr extends StatelessWidget {
  const NavigationDrawerr({super.key});
  @override
  Widget build(BuildContext context) =>
      Drawer(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );
}
Widget buildMenuItem(BuildContext context) {
  final user = Provider
      .of<UserProvider>(context)
      .user;
  List<ItemModel> list = [];
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  if (user == null) return SizedBox(); // safeguard

  // Common item: Logout
  final logoutItem = ItemModel(Icon(Icons.logout), 'Log out', () {
    logout(Provider.of<UserProvider>(context, listen: false).token);
    Provider.of<UserProvider>(context,listen: false).clearUser();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => LoginView(type: user.userType)),
          (r) => false,
    );
  });
  final archiveItem = ItemModel(Icon(Icons.archive_outlined), 'Archive', () {

    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>
        BlocProvider(
            create: (_) => ProjectCubit()..fetchProjects(userProvider.token ?? ''),
            child: ArchiveView())));
  });

  // Student menu
  if (user.userType == 'student') {
    list = [
      ItemModel(Icon(Icons.lightbulb_outline), 'Project', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProjectIdeasScreen()));
      }),
      ItemModel(Icon(Icons.task_outlined), 'Tasks', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TasksTabsScreen()));
      }),
      ItemModel(Icon(Icons.people_alt_outlined), 'Teams', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TeamsTabsScreen()));
      }),
      archiveItem,
      logoutItem,
    ];
  }

  // Admin menu
  else if (user.userType == 'admin') {
    list = [
      ItemModel(Icon(Icons.lightbulb_outline), 'Project', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProjectIdeasScreen()));
      }),
      ItemModel(Icon(Icons.people_alt_outlined), 'Teams', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TeamsTabsScreen()));
      }),
      ItemModel(Icon(Icons.manage_accounts_outlined), 'User Management', () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UserListView(token: userProvider.token ?? ''),
          ),
        );
      }),

      archiveItem,
      logoutItem,
    ];
  }
  // Supervisor menu
  else if (user.userType == 'supervisor') {
    list = [
      ItemModel(Icon(Icons.lightbulb_outline), 'Project', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProjectIdeasScreen()));
      }),
      ItemModel(Icon(Icons.people_alt_outlined), 'Teams', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TeamsTabsScreen()));
      }),
      ItemModel(Icon(Icons.date_range_outlined), 'Schedule', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ScheduleView()));
      }),

      ItemModel(Icon(Icons.task_outlined), 'Tasks', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TasksTabsScreen()));
      }),
      ItemModel(Icon(Icons.file_copy_outlined), 'Report', () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportView(token: Provider.of<UserProvider>(context, listen: false).token??''),
          ),
        );
      }),
      archiveItem,
      logoutItem,
    ];
  }

  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Wrap(
          runSpacing: 16,
          children: list
              .map((item) =>
              ListTile(
                leading: item.itemIcon,
                title: Text(item.itemTitle),
                onTap: () {
                  Navigator.pop(context);
                  item.itemOnTap();
                },
              ))
              .toList(),
        ),
        const Divider(color: Colors.black),
      ],
    ),
  );
}



Widget buildHeader(BuildContext context) {
  return Material(
      color: ColorManager.blueEo,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileView()));
          },
          child: Container(
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  bottom: 24),
              color: ColorManager.blueEo,
              child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,

                      child:Text(Provider.of<UserProvider>(context, listen: false).user!.name.toString()[0].toUpperCase(),
                        style: TextStyles.blue4D18w700,),
                    ),
                  ]
              )
          )
      )
  );
}
