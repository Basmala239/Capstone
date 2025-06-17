import 'package:capstone/features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/custom_buttons.dart';

class AddNewReportBody extends StatefulWidget {
  const AddNewReportBody({super.key});

  @override
  State<AddNewReportBody> createState() => _AddNewReportBodyState();
}

class _AddNewReportBodyState extends State<AddNewReportBody> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  DateTime selectedDate = DateTime.now();


  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Title of project', titleController),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 3,
                        child: Text('Supervisor :',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                    Expanded(flex: 5, child: Text(Provider
                        .of<UserProvider>(context, listen: false)
                        .user!
                        .name
                        .toString(), style: TextStyle(fontSize: 15))),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 3,
                        child: Text('Meeting Date :', style: const TextStyle(
                            fontWeight: FontWeight.bold))),
                    Expanded(flex: 5, child: TextButton(
                      onPressed: _pickDate,
                      child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                    ),),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Topics Discussed in the meeting:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildInputBox(),
                const SizedBox(height: 16),
                const Text(
                  'Tasks given to the students :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildInputBox(),
                const SizedBox(height: 16),
                const Text(
                  'Attendance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildAttendanceTable(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomGeneralButton(text: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        editwidth: 130,
                        editheight: 40,
                        inverse: true),
                    CustomGeneralButton(text: 'Save', onTap: () {
                      Navigator.pop(context);
                    }, editwidth: 130, editheight: 40,),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            )
        ));
  }

  Widget _buildInfoRow(String label, TextEditingController controller) {
    return Row(
      children: [
        Expanded(flex: 3,
            child: Text('$label :',
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 5, child: TextField(controller: controller)),
      ],
    );
  }

  Widget _buildInputBox() {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        maxLines: null,
        expands: true,
        decoration: InputDecoration.collapsed(hintText: ''),
      ),
    );
  }

  Widget _buildAttendanceTable() {
    final students = [
      {'name': '', 'attend': false, 'comment': 'No Comment'},
      {'name': '', 'attend': false, 'comment': 'No Comment'},
      {'name': '', 'attend': false, 'comment': 'No Comment'},
    ];

    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(40),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(60),
        3: FlexColumnWidth(),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.grey),
          children: [
            TableCell(child: Center(child: Padding(
                padding: EdgeInsets.all(4), child: Text('Num')))),
            TableCell(child: Center(child: Padding(
                padding: EdgeInsets.all(4), child: Text('Name')))),
            TableCell(child: Center(child: Padding(
                padding: EdgeInsets.all(4), child: Text('Attend')))),
            TableCell(child: Center(child: Padding(
                padding: EdgeInsets.all(4), child: Text('Comment')))),
          ],
        ),
        ...students.map((student) {
          return TableRow(

            children: [
              Center(child: Padding(padding: const EdgeInsets.all(4),
                  child: Text(
                      (students.toList().indexOf(student) + 1).toString()))),
              Center(child: Padding(padding: const EdgeInsets.all(4),
                  child: Text(student["name"].toString()))),
              Center(child: Checkbox(
                  value: student["attend"] as bool, onChanged: null)),
              TextField(),
            ],
          );
        }),
      ],
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

}