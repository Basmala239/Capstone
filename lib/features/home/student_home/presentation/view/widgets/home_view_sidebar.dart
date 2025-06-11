import 'package:capstone/features/auth/presentation/view/login_view/login_view.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../archive/presentation/model_view/project_cubit.dart';
import '../../../../../archive/presentation/view/archive_view.dart';
import '../../../../../profile/presentation/view/profile_view/profile_view.dart';
import '../../../data/model/list_item.dart';

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
  List<ItemModel> list = [
    ItemModel(Icon(Icons.lightbulb_outline), 'Projects', () {}),
    ItemModel(Icon(Icons.schedule), 'Schedule', () {}),
    ItemModel(Icon(Icons.archive), 'Archive', () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ArchiveView()));
    }),
    ItemModel(Icon(Icons.logout), 'Log out', () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ArchiveView()));
    }),
  ];
  return Padding(padding: EdgeInsets.all(24),
      child: Column(
          children: [
            Wrap(
              runSpacing: 16,
              children: [
                ListTile(
                    leading: list[0].itemIcon,
                    title: Text(list[0].itemTitle),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: list[1].itemIcon,
                    title: Text(list[1].itemTitle),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: list[2].itemIcon,
                    title: Text(list[2].itemTitle),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BlocProvider<ProjectCubit>(
                          create: (context) => ProjectCubit(),
                          child:ArchiveView())));
                    }
                ),
                Divider(color: ColorManager.black,),
                ListTile(
                    leading: list[3].itemIcon,
                    title: Text(list[3].itemTitle),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginView()), (r) => false);
                    }
                ),

              ]
          )

          ]
      )
  );
}
Widget buildHeader(BuildContext context) {
  return Material(
      color: ColorManager.blueEo,
      child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
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
                      // child:user.image!=null ?
                      // Image.network(user.image!):
                      // Text(user.name[0].toUpperCase(),
                      //   style: TextStyles.blue4D18w700,),
                    ),
                  ]
              )
          )
      )
  );
}
