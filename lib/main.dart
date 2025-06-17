
import 'package:capstone/features/auth/presentation/model_view/reset_password_provider/reset_password_provider.dart';
import 'package:capstone/features/notification/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/model_view/login_provider/Login_provider.dart';
import 'features/auth/presentation/model_view/set_new_password_provider/set_new_password_provider.dart';
import 'features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'features/auth/presentation/model_view/verify_email/verify_email_provider.dart';
import 'features/splash/presentation/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().initNotification();
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
        ChangeNotifierProvider(create: (context)=>VerifyEmailProvider()),
        ChangeNotifierProvider(create: (context)=>SetNewPassword()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone',
      //home: TasksListScreen(),
     // home: Test(),
      home: SplashView(),
      //home: AddUserView(),
    ));
  }
}
// class Test extends StatelessWidget {
//   const Test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(onPressed: () async {
//       const String url = 'https://dev.3bhady.com/api/v1/dashboard/reports/1';
//
//
//       }, child: Text('click')),
//       ),
//     );
//   }
// }

//NotificationService().showNotification(
//             title: "test",
//             body: "It working",
//           );


