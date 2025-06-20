import 'package:capstone/features/auth/data/models/student_model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../../../profile/presentation/view/profile_view/widgets/data_widget.dart';
import '../../../../../data/repository/get_student_repository/get_student_repository.dart';

class GetStudentBody extends StatelessWidget {
  final int id;
  const GetStudentBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token ?? '';

    return FutureBuilder<Student>(
      future: getStudent(token, id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No user data found.'));
        }

        final user = snapshot.data!;
        return SingleChildScrollView(
            child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dataWidget('ID', user.id.toString()),
              dataWidget('Name', user.name),
              dataWidget('Email', user.email),
              dataWidget('Type', user.userType),
              dataWidget('Department', user.department),
              dataWidget('Github', user.github?? 'Not Found'),
              dataWidget('TeamID', user.teamId.toString()),
              dataWidget('Year', user.year),
              dataWidget('Created', user.createdAt.toString()),
              dataWidget('Updated', user.updatedAt.toString()),
            ],
          ),
        ));
      },
    );
  }
}
