import 'package:capstone/features/archive/presentation/view/widgets/archive_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../utils/here.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  ///[Here.basmala_white_space] uncomment the following code 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: customAppBar('Archive', context),
      body: Stack(
        children: [
          Background(),
          ArchiveViewBody()
        ],
      ),
    );
  }
}