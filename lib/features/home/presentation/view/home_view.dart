import 'package:capstone/features/chatbot/presentation/view/chatbot_view.dart';
import 'package:capstone/features/home/presentation/admin/view/widget/home_body.dart';
import 'package:capstone/features/home/presentation/student/view/widget/home_body.dart';
import 'package:capstone/features/home/presentation/supervisor/view/widget/home_body.dart';
import 'package:capstone/features/home/presentation/view/widgets/home_view_appbar.dart';
import 'package:capstone/features/home/presentation/view/widgets/home_view_sidebar.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/model_view/user_provider/user_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Background(),

          if(userProvider.user?.userType =='student')
            StudentHomeViewBody(),
          if(userProvider.user?.userType=='admin')
            AdminHomeViewBody(),
          if(userProvider.user?.userType=='supervisor')
            SupervisorHomeViewBody(),
        ],
      ),
      drawer:NavigationDrawerr() ,
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
