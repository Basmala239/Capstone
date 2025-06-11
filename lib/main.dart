import 'package:capstone/features/report/presentation/view/report_view.dart';
import 'package:flutter/material.dart';
import 'features/schedule/presentation/view/schedule_view.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'features/user_management/presentation/view/user_view/user_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone',
      home: UserView(),
     // home: ReportView(),
    );
  }
}
