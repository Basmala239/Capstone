import 'package:capstone/features/auth/data/models/student_model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
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
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🆔 ID: ${user.id}'),
              Text('👤 Name: ${user.name}'),
              Text('📧 Email: ${user.email}'),
              Text('🧩 Type: ${user.userType}'),
              Text('🧩 Type: ${user.department}'),
              Text('🧩 Type: ${user.github}'),
              Text('🧩 Type: ${user.teamId}'),
              Text('🧩 Type: ${user.year}'),
              Text('📅 Created: ${user.createdAt}'),
              Text('🕓 Updated: ${user.updatedAt}'),
            ],
          ),
        );
      },
    );
  }
}
