import 'package:flutter/material.dart';

import '../../../../../../widgets/custom_buttons.dart';
import '../../add_user/add_user_view.dart';

class ImportedFilesPage extends StatelessWidget {
  final List<Map<String, String>> files = List.generate(
    5,
        (index) => {
      'name': 'Students_4_2025.xlsx',
      'date': '11/3/2025',
    },
  );

  ImportedFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  'Imported Files',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Manage the files you have uploaded.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('File Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Date Uploaded', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  ...files.map(
                        (file) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(file['name']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(file['date']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {},
                              ),
                              SizedBox(width: 3,),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          CustomGeneralButton(
            text: 'Add Users',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUserView()));
            },
          ),
          SizedBox(height: 10,)
        ],
    );
  }
}


