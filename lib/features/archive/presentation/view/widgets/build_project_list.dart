
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../data/model/project_model.dart';

Widget buildProjectList(List<ProjectModel> projects){
  return ListView.builder(
      itemCount: projects.length
      ,itemBuilder: (context,index)=>card(projects[index])
  );
}

Widget card(ProjectModel project){
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
              child:project.image!=null ?
              Image.network(project.image!):
              Text(project.name[0].toUpperCase(),
                style: TextStyles.blue4D18w700,),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(project.name,
                style: TextStyles.black20W500,),
                Text(project.supervisor)
              ],
            )
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
                onPressed: (){}, child: Text("See More",
            style: TextStyles.white18w400
            ))
          ],
        )
      ],
    ),

  );
}