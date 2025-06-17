import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../auth/data/models/admin_model/admin_model.dart';
import '../../../../../../auth/presentation/model_view/user_provider/user_provider.dart';
import '../../../../../data/repository/get_admin_repository/get_admin_repository.dart';

class GetAdminBody extends StatelessWidget {
  final int id;
  const GetAdminBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token ?? '';

    return FutureBuilder<Admin>(
      future: getAdmin(token,id),
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
              Text('📅 Created: ${user.createdAt}'),
              Text('🕓 Updated: ${user.updatedAt}'),
            ],
          ),
        );
      },
    );
  }
}
