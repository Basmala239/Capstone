import 'package:capstone/resources/color_manager.dart';
import 'package:capstone/utils/size_config.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.controller,
    required this.hint,
    required this.ontap,
    this.isPassword = false,
    this.obscureText = false,
    this.textInputType = TextInputType.text,this.empty= false, this.wrong= false,
    });

  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final bool empty;
  final VoidCallback? ontap;
  final bool wrong;
  bool obscureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint),
        const SizedBox(height: 3,),
        Container(
          
          padding: const EdgeInsets.symmetric(vertical:13,horizontal: 15),
          decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(width: 1,color :ColorManager.gray4Dop),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 42,
            width: 363*SizeConfig.horizontalBlock,
            child: TextField(
              keyboardType: textInputType, 
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                suffixIcon: isPassword? IconButton(
                  icon: Icon(
                    obscureText?Icons.visibility:Icons.visibility_off, 
                    color: ColorManager.gray4D,),
                  onPressed: ontap,): null,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5,),

        //errors
        if(empty)
        Text('Please Enter $hint',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w400
        ),),
        if(wrong)
        Text('the $hint is not correct',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}