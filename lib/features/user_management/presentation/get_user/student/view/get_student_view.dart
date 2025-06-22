import 'package:capstone/features/user_management/presentation/get_user/student/view/widget/get_student_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../widgets/background.dart';
import '../../../../data/repository/delete_user_repository/delete_user_repository.dart';
import '../../../all_users/view/all_users_view.dart';
import '../../../update_user/update_user_view.dart';
import '../../widget/show_dialog.dart';
class GetStudentView extends StatelessWidget {
  const GetStudentView({super.key, required this.id, required this.token});

  final String token;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blueCC,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorManager.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Details',
          style: TextStyles.white24w700,),
        actions: [
          PopupMenuButton(itemBuilder: (context) =>
          [
            PopupMenuItem(
              value: 'Edit',
              child: Text('Edit'),
            ), PopupMenuItem(
            value: 'Delete',
            child: Text('Delete'),
          ),
          ],
            onSelected: (String choice) async {
              if (choice == 'Edit') {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUserView(token: token, id: id, type: 'student',)));
              } else {
                if (await showExitDialog(context)) {
                  if (await deleteUser(token: token, userId: id, userType: 'student',)) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListView(token: token,)));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Server Error'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }

              }
            },)
        ],
      ),
      body: Stack(
        children: [
          Background(),
          GetStudentBody(id: id)
        ],
      ),
    );
  }
}
