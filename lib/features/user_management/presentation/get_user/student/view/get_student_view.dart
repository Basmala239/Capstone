import 'package:capstone/features/user_management/presentation/get_user/student/view/widget/get_student_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../widgets/background.dart';
import '../../../../data/repository/delete_user_repository/delete_user_repository.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
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
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileView()));
              } else {
                if (await showExitDialog(context)) {
                  if (await deleteUser(token: token, userId: id, userType: 'student',)) {
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Server Error'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                } else {
                  print('cancel');
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
