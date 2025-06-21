import 'package:capstone/features/user_management/presentation/get_user/admin/view/get_admin_view.dart';
import 'package:capstone/features/user_management/presentation/get_user/supervisor/view/get_supervisor_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../auth/data/models/app_user/app_user_model.dart';
import '../../../get_user/student/view/get_student_view.dart';

Widget userCard(AppUser user, BuildContext context, String token) {
  return GestureDetector(
      onTap: () {
        if(user.userType =='admin') {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> GetAdminView(id: user.id, token: token,)));
        }else if(user.userType =='student'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> GetStudentView(id: user.id, token: token,)));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> GetSupervisorView(id: user.id, token: token,)));
        }
      },
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4)
            ],

          ),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(user.name),
            subtitle: Text("${user.email} • ${user.userType}"),
          )
      )
  );
}