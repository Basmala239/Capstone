import 'package:capstone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../widgets/custom_buttons.dart';
import '../../../../../../auth/data/models/admin_model/admin_model.dart';
import '../../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../../data/repository/get_admin_repository/get_admin_repository.dart';
import '../../../../../data/repository/update_user_repository/update_user_repository.dart';
class UpdateAdminBody extends StatefulWidget {
  const UpdateAdminBody({super.key, required this.token, required this.id});
  final String token;
  final int id;
  @override
  State<UpdateAdminBody> createState() => _UpdateAdminBodyState();
}

class _UpdateAdminBodyState extends State<UpdateAdminBody> {

  late final TextEditingController _nameController ;
  @override
  Widget build(BuildContext context) {
    final token = Provider
        .of<UserProvider>(context, listen: false)
        .token ?? '';
    return FutureBuilder<Admin>(
        future: getAdmin(token,widget.id),
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
      return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        if(await updateUser(token: widget.token, userId: widget
                            .id, userType: 'admin', name: _nameController.text
                            .trim(),)){
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
                const SizedBox(height: 100),
              ],
            ),
          )

      );
    }
    );
  }
}
