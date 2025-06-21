import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:capstone/utils/here.dart';

class Background extends StatelessWidget {
  const Background({super.key});
///[Here.basmala_white_space] use another number <4(ex) 1025> for height to solve the issue in the archive view & other views that have a white space at the bottom
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
        width: 412*SizeConfig.horizontalBlock,
        height: 917*SizeConfig.verticalBlock,
       child: Image.asset(AssetsManager.backgroundImage,opacity: const AlwaysStoppedAnimation(0.30),fit: BoxFit.fill,),
    );
  }
}