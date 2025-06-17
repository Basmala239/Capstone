import 'package:capstone/features/chatbot/presentation/view/widgets/chatbot_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/background.dart';
import '../../../../widgets/custom_appbar.dart';
import '../model_view/chat_cubit.dart';
class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: customAppBar('Chatbot', context),
        body: Stack(
          children: [
            Background(),
            ChatBotBody(),
          ],
        ),
      ),
    );
  }
}
