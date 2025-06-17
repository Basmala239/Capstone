import 'package:capstone/features/archive/presentation/view/view_project_details/project_details_body.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
class ProjectDetailsView extends StatelessWidget {
  final String token;
  final int id;
  const ProjectDetailsView({super.key, required this.token, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Project Details', context),
      body: Stack(
        children: [
          Background(),
          ProjectDetailsBody(token: token, id: id)
        ],
      ),
    );
  }
}
