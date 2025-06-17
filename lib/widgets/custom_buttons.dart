import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:capstone/utils/size_config.dart';
import 'package:flutter/material.dart';
class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, required this.text, this.onTap, this.editwidth=363,this.editheight=61,this.inverse=false});
  final String text;
  final VoidCallback? onTap;
  final double editwidth;
  final double editheight;
  final bool inverse;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: editheight,
        width:editwidth*SizeConfig.horizontalBlock,
        decoration: BoxDecoration(
          color:inverse?ColorManager.op: ColorManager.blueEo,
          borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4)
            ],
          border: inverse? Border.all(color:ColorManager.blueEo):Border.all(color:ColorManager.op)
        ),
        child: Center(
          child: Text(
            text,
            style: inverse?TextStyles.blue4D18w700 :TextStyles.white22w700,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}