import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../widgets/custom_buttons.dart';
import '../../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../../data/repository/get_supervisor_repository/get_supervisor_repository.dart';
import '../../../../../data/repository/update_user_repository/update_user_repository.dart';
class UpdateSupervisorBody extends StatefulWidget {
  const UpdateSupervisorBody({super.key, required this.token, required this.id});

  final String token;
  final int id;

  @override
  State<UpdateSupervisorBody> createState() => _UpdateSupervisorBodyState();
}

class _UpdateSupervisorBodyState extends State<UpdateSupervisorBody> {
  late TextEditingController _maxTeamsAllowedController;

  late TextEditingController _availabilityController;

  late TextEditingController _nameController;

  late TextEditingController _departmentController;

  @override
  Widget build(BuildContext context) {
    final token = Provider
        .of<UserProvider>(context, listen: false)
        .token ?? '';
    return FutureBuilder<Supervisor>(
        future: getSupervisor(token, widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No user data found.'));
          }

          final user = snapshot.data!;
          _nameController = TextEditingController(text: user.name);
          _departmentController = TextEditingController(text: user.department);
          _availabilityController =
              TextEditingController(text: user.availability.toString());
          _maxTeamsAllowedController =
              TextEditingController(text: user.maxTeamsAllowed.toString());

          return SingleChildScrollView(
              child: Padding(padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomTextField(controller: _nameController, hint: 'Name'),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: _departmentController, hint: 'Department'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: _maxTeamsAllowedController,
                        hint: 'Max Teams Allowed'),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: _availabilityController,
                        hint: 'Availability'),
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
                            if(await updateUser(
                                token: Provider.of<UserProvider>(context, listen: false).token ?? '',
                                name: _nameController.text.trim(), userId: widget.id, userType: 'student',
                                department: _departmentController.text.trim(),
                                availability: _availabilityController.text.trim(),
                                maxTeamsAllowed: _maxTeamsAllowedController.text.trim()
                            )){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              SnackBar(
                                content: Text('Edited successfully'),
                                duration: Duration(seconds: 2),
                              );
                            }else{
                              Navigator.pop(context);
                              SnackBar(
                                content: Text('Server error'),
                                duration: Duration(seconds: 2),
                              );
                            }
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
    );
  }
}

