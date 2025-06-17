import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/custom_buttons.dart';
import '../../../../../data/repository/update_user_repository/update_user_repository.dart';
class UpdateAdminBody extends StatefulWidget {
  const UpdateAdminBody({super.key, required this.token, required this.id});
  final String token;
  final int id;
  @override
  State<UpdateAdminBody> createState() => _UpdateAdminBodyState();
}

class _UpdateAdminBodyState extends State<UpdateAdminBody> {

  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(18),
          child: Column(
            children: [
              CustomTextField(controller: _nameController, hint: 'Name'),
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
                      if(await updateUser(token: widget.token, userId: widget.id, userType: 'admin', name: _nameController.text.trim(),)){

                      }
                    },
                    editwidth: 130,
                    editheight: 40,
                  ),

                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        )
    );
  }
}
