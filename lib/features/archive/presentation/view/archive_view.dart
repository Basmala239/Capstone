import 'package:capstone/features/archive/presentation/view/widgets/archive_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/custom_appbar.dart';
import '../model_view/project_cubit.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Archive', context),
      body: Stack(
        children: [
          Background(),
          BlocProvider(
              create: (_) =>
              ProjectCubit()
                ..fetchProjects(),
              child:
              ArchiveViewBody()
          )
        ],
      ),
    );
  }
}