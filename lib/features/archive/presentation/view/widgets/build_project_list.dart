import 'package:capstone/features/archive/presentation/view/view_project_details/project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../teams/data/models/project_model.dart';

Widget projectCard(ProjectModel project, BuildContext context){
  return Container(
    width: double.infinity,
    height: 270,
    padding: EdgeInsets.all(18),
    margin: EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.blueEC,
              radius: 30,
              child:Text(project.name[0].toUpperCase(),
                style: TextStyles.blue4D18w700,),
            ),
            const SizedBox(width: 10,),

                Text(project.name,
                style: TextStyles.black20W500,),
          ],
        ),
        const SizedBox(height: 10,),
        Text(project.description,
        maxLines: 5,),
        const Spacer(),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
                backgroundColor: WidgetStatePropertyAll(ColorManager.blueEo)
              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProjectDetailsView(token: Provider.of<UserProvider>(context, listen: false).token??'',id: project.id,)));
                }, child: Text("See More",
            style: TextStyles.white18w400
            ))
          ],
        )
      ],
    ),

  );
}