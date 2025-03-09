import 'package:capstone/features/archive/presentation/view/widgets/archive_view_body.dart';
import 'package:capstone/utils/widgets/background.dart';
import 'package:capstone/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Archive', context),
      body: Stack(
        children: [
          Background(),
          ArchiveViewBody(),
        ],
      ),
    );
  }
}