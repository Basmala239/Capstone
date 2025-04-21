
import 'package:capstone/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

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
    height: 250,
    padding: EdgeInsets.all(18),
    margin: EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child:project.image!=null ?
              Image.network(project.image!):
              Text(project.name[0].toUpperCase(),
                style: TextStyles.blue4D18w700,),
            ),
            const SizedBox(width: 10,),
            Column(
              children: [
                Text(project.name),
                Text(project.supervisor)
              ],
            )
          ],
        ),
        const SizedBox(height: 10,),
        Text(project.description,
        maxLines: 5,),
        CustomGeneralButton(text: 'See more',onTap: (){},editwidth: 150,)
      ],
    ),

  );
}