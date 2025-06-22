import 'package:capstone/features/user_management/presentation/update_user/admin/view/widget/update_admin_body.dart';
import 'package:capstone/features/user_management/presentation/update_user/student/view/widget/update_student_body.dart';
import 'package:capstone/features/user_management/presentation/update_user/supervisor/view/widget/update_supervisor_body.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/background.dart';
import '../../../../widgets/custom_appbar.dart';
class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key, required this.token, required this.type, required this.id});
  final String token;
  final String type;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Edit user', context),
      body: Stack(
        children: [
          Background(),
          if(type == 'admin')
            UpdateAdminBody(token: token, id: id),
          if(type == 'student')
            UpdateStudentBody(token: token, id: id),
          if(type == 'supervisor')
            UpdateSupervisorBody(token: token, id: id),
        ],
      ),
    );
  }
}
