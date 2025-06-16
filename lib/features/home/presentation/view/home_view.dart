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
    print("home view :${Provider.of<UserProvider>(context, listen: false).user?.userType}");

    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Background(),

          if(Provider.of<UserProvider>(context, listen: false).user?.userType =='student')
            StudentHomeViewBody(),
          if(Provider.of<UserProvider>(context, listen: false).user?.userType=='admin')
            AdminHomeViewBody(),
          if(Provider.of<UserProvider>(context, listen: false).user?.userType=='super_visor')
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
