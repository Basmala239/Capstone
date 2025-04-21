import 'package:capstone/features/chatbot/presentation/view/chatbot_view.dart';
import 'package:capstone/features/home/presentation/view/widgets/home_view_appber.dart';
import 'package:capstone/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/utils/widgets/background.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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