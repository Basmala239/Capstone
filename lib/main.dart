import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/archive/presentation/model_view/project_cubit.dart';
import 'features/archive/presentation/view/archive_view.dart';


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
      home: BlocProvider<ProjectCubit>(
        create: (context) => ProjectCubit(),
        child: ArchiveView(),
      )
      //home:SplashView(),
    );
  }
}
