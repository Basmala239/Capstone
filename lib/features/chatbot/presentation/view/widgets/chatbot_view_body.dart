import 'package:flutter/material.dart';

import '../../../data/model/chat_message_model.dart';
import '../../../data/repository/chatbot_repository.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
class ChatBotBody extends StatefulWidget {
  const ChatBotBody({super.key});

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(message: text, isUser: true));
      _controller.clear();
    });

    final botReply = await sendChatMessage(text);

    setState(() {
      _messages.add(ChatMessage(message: botReply ?? 'No response', isUser: false));
    });
  }

  Widget _buildMessage(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: msg.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: msg.isUser
            ? Text(
          msg.message,
          style: TextStyle(color: Colors.white),
        )
            : MarkdownBody(
          data: msg.message,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(fontSize: 14),
            strong: TextStyle(fontWeight: FontWeight.bold),
            listBullet: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[_messages.length - 1 - index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask about your project idea...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.blue,
                )
              ],
            ),
          )
        ],

    );
  }
}
