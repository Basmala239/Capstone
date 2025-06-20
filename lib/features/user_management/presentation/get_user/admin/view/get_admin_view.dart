import 'package:capstone/features/auth/presentation/model_view/admin_user_provider/admin_user_provider.dart';
import 'package:capstone/features/user_management/presentation/get_user/admin/view/widget/get_admin_body.dart';
import 'package:capstone/features/user_management/presentation/update_user/update_user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../widgets/background.dart';
import '../../../../data/repository/delete_user_repository/delete_user_repository.dart';
import '../../../all_users/view/all_users_view.dart';
import '../../widget/show_dialog.dart';
class GetAdminView extends StatelessWidget {
  const GetAdminView({super.key, required this.id, required this.token});

  final int id;
  final String token;

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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUserView(token: token, id: id, type: 'admin',)));
              } else {
                if (id == Provider
                    .of<AdminUserProvider>(context, listen: false)
                    .user
                    ?.id) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Can\'t Delete yourself'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  if (await showExitDialog(context)) {
                    if (await deleteUser(
                      token: token, userId: id, userType: 'admin',)) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListView(token: token,)));
                    } else {
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
              }
            }
          )
        ],
      ),
      body: Stack(
        children: [
          Background(),
          GetAdminBody(id: id)
        ],
      ),
    );
  }
}