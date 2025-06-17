import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/custom_buttons.dart';
class UpdateSupervisorBodyBodyBody extends StatelessWidget {
  UpdateSupervisorBodyBodyBody({super.key, required this.token, required this.id});

  final String token;
  final int id;
  final _nameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _maxTeamsAllowedController = TextEditingController();
  final _availabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(18),
          child: Column(
            children: [
              CustomTextField(controller: _nameController, hint: 'Name'),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _departmentController, hint: 'Department'),
              const SizedBox(height: 10),
              CustomTextField(controller: _maxTeamsAllowedController, hint: 'Max Teams Allowed'),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _availabilityController, hint: 'Availability'),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomGeneralButton(
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    editwidth: 130,
                    editheight: 40,
                    inverse: true,
                  ),
                  CustomGeneralButton(
                    text: 'Save',
                    onTap: () async {
                      // await updateProfile(
                      //   token: Provider.of<UserProvider>(context, listen: false).token ?? '',
                      //   name: nameController.text.trim(),
                      //   email:  userProvider.user?.email ?? 'Email',
                      // );
                    },
                    editwidth: 130,
                    editheight: 40,
                  ),

                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        )
    );
  }
}
