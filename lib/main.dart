import 'package:capstone/features/auth/presentation/model_view/reset_password_provider/reset_password_provider.dart';
import 'package:capstone/features/auth/presentation/view/login_view/login_view.dart';
import 'package:capstone/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/model_view/login_provider/Login_provider.dart';
import 'features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'features/task/presentation/view/pages/tasks_list_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
        ChangeNotifierProvider(create: (context)=>VisibilityProvider()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>ResetPassword()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone',
      //home: TasksListScreen(),
      home: SplashView(),
     // home: ReportView(),
    ));
  }
}
