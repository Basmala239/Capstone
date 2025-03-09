import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/resources/text_styles.dart';
import 'package:flutter/widgets.dart';

Widget dataWidget(String dataType,String data){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(dataType, style: TextStyles.blue4D18w700,),
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorManager.whiteop,
          border: Border.all(color: ColorManager.white),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(data, style: TextStyles.blue4D15w300,),
      ),
    ],
  );
}