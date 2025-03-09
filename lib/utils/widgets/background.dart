import 'package:capstone/resources/assets_manager.dart';
import 'package:capstone/utils/size_config.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

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