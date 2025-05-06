import 'package:capstone/features/archive/presentation/view/archive_view.dart';
import 'package:capstone/features/chatbot/presentation/view/chatbot_view.dart';
import 'package:capstone/features/home/student_home/presentation/view/widgets/home_view_appbar.dart';
import 'package:capstone/features/home/student_home/presentation/view/widgets/home_view_body.dart';
import 'package:capstone/features/profile/presentation/view/profile_view/profile_view.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';

import '../../data/model/list_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<ItemModel> itemList=[
      ItemModel(Icon(Icons.person_outline),'Profile',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));}),
      ItemModel(Icon(Icons.lightbulb_outline),'Projects',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));}),
      ItemModel(Icon(Icons.schedule),'Schedule',(){}),
      ItemModel(Icon(Icons.archive),'Archive',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));}),
      ItemModel(Icon(Icons.logout),'Log out',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));}),
    ];
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Background(),
          HomeViewBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.blueCC,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatbotView()));
        },
        child: Image.asset(AssetsManager.chatbotImage),
        ),
    );
  }
}