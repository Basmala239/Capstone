import 'package:flutter/material.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../data/model/project_model.dart';
import '../view_project_details/view_project_details.dart';

Widget projectCard(Project project, BuildContext context) {
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
              child: Text(project.title[0].toUpperCase(),
                style: TextStyles.blue4D18w700,),
            ),
            const SizedBox(width: 10,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(project.title,
                    style: TextStyles.black20W500,),
                  Text(project.supervisor,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
            Spacer(),
            Text(
              '${project.year}', style: TextStyle(fontWeight: FontWeight.bold),)
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ViewProjectDetails(project: project,)));
                }, child: Text("See More",
                style: TextStyles.white18w400
            ))
          ],
        )
      ],
    ),

  );
}