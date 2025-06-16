import 'package:capstone/features/chatbot/presentation/view/widgets/chatbot_view_body.dart';
import 'package:capstone/widgets/background.dart';
import 'package:capstone/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Chatbot', context),
      body: Stack(
        children: [
          Background(),
          ChatBotBody(),
        ],
      ),
    );
  }
}