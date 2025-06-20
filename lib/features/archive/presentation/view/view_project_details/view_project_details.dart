import 'package:capstone/features/archive/presentation/view/view_project_details/widget/view_project_details_body.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/background.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../data/model/project_model.dart';

class ViewProjectDetails extends StatelessWidget {
  const ViewProjectDetails({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Project', context),
        body: Stack(
            children: [
              Background(),
              ViewProjectDetailsBody(project: project),
            ]
        )
    );
  }
}
