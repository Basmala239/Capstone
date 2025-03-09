import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/features/auth/presentation/view/roles_view/roles_view.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  
  @override
  void initState() {
    super.initState();
    goToNextView(context);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
                  AssetsManager.logoImage,
                ),
          Text('Capstone'),
        ],
      ),
    );
  }
}
void goToNextView(context){
  Future.delayed(const Duration(seconds: 3),(){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const RolesView()) );
  });
}