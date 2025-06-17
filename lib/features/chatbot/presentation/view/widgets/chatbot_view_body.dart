import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../data/model/chat_message_model.dart';
import '../../model_view/chat_cubit.dart';

class ChatBotBody extends StatelessWidget {
  ChatBotBody({super.key});
  final TextEditingController _controller = TextEditingController();

  void _send(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<ChatCubit>().sendMessage(text);
    _controller.clear();
  }

  Widget _buildMessage(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: msg.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: msg.isUser
            ? Text(msg.message, style: const TextStyle(color: Colors.white))
            : MarkdownBody(
          data: msg.message,
          styleSheet: MarkdownStyleSheet(
            p: const TextStyle(fontSize: 14),
            strong: const TextStyle(fontWeight: FontWeight.bold),
            listBullet: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              final messages = state is ChatUpdated ? state.messages : [];
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    _buildMessage(messages[messages.length - 1 - index]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Ask about your project idea...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _send(context),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
