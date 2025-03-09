import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/utils/size_config.dart';
import 'package:flutter/material.dart';
class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.text, this.onTap, this.editwidth=363});
  final String? text;
  final VoidCallback? onTap;
  final double? editwidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 61,
        width:editwidth!*SizeConfig.horizontalBlock,
        decoration: BoxDecoration(
          color: ColorManager.blueEo,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 14,
              color: ColorManager.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}