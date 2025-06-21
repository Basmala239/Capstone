import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../date/model/meeting_model.dart';
import '../../../../model_view/add_meeting/add_meeting_cubit.dart';

class AddMeetingForm extends StatefulWidget {
  final Map<String, int> teamMap;

  const AddMeetingForm({super.key, required this.teamMap});

  @override
  _AddMeetingFormState createState() => _AddMeetingFormState();
}

class _AddMeetingFormState extends State<AddMeetingForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? selectedTeam;

  @override
  void initState() {
    selectedTeam = widget.teamMap.keys.first;
    super.initState();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;

    final start = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final meeting = MeetingModel(
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      startTime: start,
      endTime: start.add(Duration(hours: 1)),
      teamId: widget.teamMap[selectedTeam]!,
      createdByUserId: 2,
    );

    context.read<AddMeetingCubit>().submitMeeting(meeting);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMeetingCubit, AddMeetingState>(
      listener: (context, state) {
        if (state is AddMeetingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Meeting created successfully!")));
          Navigator.pop(context);
        } else if (state is AddMeetingError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              TextButton(onPressed: _pickDate, child: Text('Date: ${selectedDate.toLocal()}'.split(' ')[0])),
              TextButton(onPressed: _pickTime, child: Text('Time: ${selectedTime.format(context)}')),
              DropdownButton<String>(
                value: selectedTeam,
                onChanged: (val) => setState(() => selectedTeam = val),
                items: widget.teamMap.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              ),
              const SizedBox(height: 16),
              state is AddMeetingLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(onPressed: _submit, child: Text('Save')),
            ],
          ),
        );
      },
    );
  }
}
