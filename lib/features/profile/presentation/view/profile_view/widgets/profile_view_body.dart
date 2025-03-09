import 'package:capstone/features/profile/presentation/view/profile_view/widgets/data_widget.dart';
import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/resources/color_manager.dart';
import 'package:flutter/widgets.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: 160,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.symmetric(horizontal: BorderSide(color: ColorManager.blue4D))
              ),
            ),
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:Image.asset(AssetsManager.profileImage),
              ),
              Text('Mohamed Ahmed'),
              dataWidget('Name', 'Mohamed Ahmed'),
              dataWidget('Email', 'Mohamed Ahmed'),
              dataWidget('ID', 'Mohamed Ahmed'),
              dataWidget('Role', 'Mohamed Ahmed'),
            ],
          )
        ],
      ),
    );
  }
}