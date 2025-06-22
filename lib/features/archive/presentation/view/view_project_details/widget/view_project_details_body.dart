import 'package:flutter/material.dart';

import '../../../../../../resources/text_styles.dart';
import '../../../../data/model/project_model.dart';

class ViewProjectDetailsBody extends StatelessWidget {
  const ViewProjectDetailsBody({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.title, style: TextStyles.black24w600,
                          ),
                          SizedBox(height: 15),
                          _buildInfoRow('Year', "${project.year}"),
                          SizedBox(height: 10),
                          _buildInfoRow("Tools", project.tools.join(', ')),
                        ],
                      )
                  )
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Team Members:", style: TextStyles.black20W500,),
                          SizedBox(height: 5),
                          ...project.teamMembers.map(
                                (m) =>
                                Text("- ${m.firstName} ${m.lastName} (${m
                                    .role}${m
                                    .isLeader
                                    ? ', Leader'
                                    : ''})", style: TextStyles.black18W400),
                          ),
                        ],
                      )
                  )
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text("Description: ", style: TextStyles.black20W500,),
                          SizedBox(height: 5),
                          Text(project.description,
                            style: TextStyles.black18W400,),
                        ],
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 3,
            child: Text('$label :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        Expanded(flex: 5, child: Text(value, style: TextStyle(fontSize: 15))),
      ],
    );
  }
}
