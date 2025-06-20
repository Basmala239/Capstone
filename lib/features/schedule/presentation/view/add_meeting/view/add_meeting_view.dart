import 'package:capstone/features/auth/presentation/model_view/user_provider/user_provider.dart';
import 'package:capstone/features/schedule/presentation/view/add_meeting/view/widget/add_meeting_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../../../widgets/background.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../date/repository/meeting_repository_impl.dart';
import '../../../model_view/add_meeting/add_meeting_cubit.dart';


class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Schedule', context),
      body: Stack(
        children: [
          Background(),
          BlocProvider(
            create: (_) =>
                AddMeetingCubit(MeetingRepositoryImpl(http.Client(), Provider
                    .of<UserProvider>(context, listen: false)
                    .token ?? '')),
            child: AddMeetingForm(teamMap: {'Team A': 1, 'Team B': 2}),
          )
        ],
      ),
    );
  }
}

