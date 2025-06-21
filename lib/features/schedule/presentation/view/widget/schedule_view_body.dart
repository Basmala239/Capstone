// import 'package:capstone/features/schedule/presentation/view/widget/team_schedule_widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../resources/assets_manager.dart';
// import '../../../../../resources/text_styles.dart';
// import '../../../../../widgets/custom_buttons.dart';
// import '../../../date/model/meeting_model.dart';
// class ScheduleViewBody extends StatefulWidget {
//   const ScheduleViewBody({super.key});
//
//   @override
//   State<ScheduleViewBody> createState() => _ScheduleViewBodyState();
// }
//
// class _ScheduleViewBodyState extends State<ScheduleViewBody> {
//
//   String selectedFrequency = 'Weekly';
//   List<String> frequencies = ['Weekly', 'Daily', 'Monthly'];
//   List<String> teamNames = ['Team name1', 'Team name2'];
//   List<ScheduleModel> schedule=[
//     ScheduleModel(AssetsManager.logoImage,'Team1','3.00 pm','15th mar 2025'),
//     ScheduleModel(AssetsManager.logoImage,'Team2','3.00 pm','15th mar 2025'),
//     ScheduleModel(AssetsManager.logoImage,'Team3','3.00 pm','15th mar 2025')
//   ];
//   void _showAddMeetingDialog() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//           left: 16,
//           right: 16,
//           top: 16,
//         ),
//         child: AddMeetingForm(teamNames: teamNames),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               DropdownButton<String>(
//                 value: selectedFrequency,
//                 items: frequencies.map((value) => DropdownMenuItem(
//                   value: value,
//                   child: Text(value),
//                 )).toList(),
//                 onChanged: (val) => setState(() => selectedFrequency = val!),
//               ),
//               CustomGeneralButton(text: 'Add meet +',onTap: _showAddMeetingDialog,editwidth:130,editheight: 40,inverse: true),
//
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: schedule.length,
//               itemBuilder: (context, index) =>teamScheduleWidget(schedule[index])
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AddMeetingForm extends StatefulWidget {
//   final List<String> teamNames;
//
//   const AddMeetingForm({required this.teamNames});
//
//   @override
//   _AddMeetingFormState createState() => _AddMeetingFormState();
// }
//
// class _AddMeetingFormState extends State<AddMeetingForm> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   String? selectedTeam;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedTeam = widget.teamNames.first;
//   }
//
//   Future<void> _pickDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() => selectedDate = picked);
//   }
//
//   Future<void> _pickTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime)
//       setState(() => selectedTime = picked);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             Expanded(flex: 3, child:Text('Select date:',style: TextStyles.black18W400)),
//             Expanded(flex: 5, child:TextButton(
//               onPressed: _pickDate,
//               child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
//             )),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: [
//             Expanded(flex: 3, child:Text('Set time:',style: TextStyles.black18W400)),
//             Expanded(flex: 5, child:TextButton(
//               onPressed: _pickTime,
//               child: Text(selectedTime.format(context)),
//             )),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: [
//             Expanded(flex: 3, child:Text('Set team:',style: TextStyles.black18W400)),
//             Expanded(flex: 5, child:DropdownButton<String>(
//               value: selectedTeam,
//               items: widget.teamNames.map((value) => DropdownMenuItem(
//                 value: value,
//                 child: Text(value),
//               )).toList(),
//               onChanged: (val) => setState(() => selectedTeam = val),
//             )),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             CustomGeneralButton(text: 'Cancel',onTap: (){
//               Navigator.pop(context);
//             },editwidth:130,editheight: 40,inverse: true),
//             CustomGeneralButton(text: 'Save',onTap: (){
//               Navigator.pop(context);
//             },editwidth:130 ,editheight: 40,),
//           ],
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }