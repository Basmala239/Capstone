import 'package:capstone/utils/network/consts.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import '../../../../../resources/color_manager.dart';

class ChatbotViewBody extends StatefulWidget {
  const ChatbotViewBody({super.key});

  @override
  State<ChatbotViewBody> createState() => _ChatbotViewBodyState();
}

class _ChatbotViewBodyState extends State<ChatbotViewBody> {
  final _opedAI = OpenAI.instance.build(token: OPENAI_API_KEY,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5,)),enableLog: true,);

  final ChatUser _currentUser = ChatUser(
      id: '1', firstName: 'Basmala', lastName: 'Ahmed');
  final ChatUser _gptChatUser = ChatUser(
      id: '2', firstName: 'Chat', lastName: 'GPT');
  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];
  bool useMockResponse = true; // Toggle this for testing

  @override
  Widget build(BuildContext context) {
    return DashChat(
        currentUser: _currentUser,
        typingUsers: _typingUsers,
        messageOptions: const MessageOptions(
            currentUserContainerColor: ColorManager.blueFF,
            containerColor: ColorManager.whiteop,
            textColor: Colors.black
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messages);
  }
  Future<void> getChatResponse(ChatMessage m) async {
    print(m.text);
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });

    // Wait to simulate response time
    await Future.delayed(const Duration(seconds: 1));

    if (useMockResponse) {
      // Mock response without calling API
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _gptChatUser,
            createdAt: DateTime.now(),
            text: "This is a mock response to: \"${m.text}\"",
          ),
        );
        _typingUsers.remove(_gptChatUser);
      });
      return;
    }

    // Actual API call (will only run if useMockResponse = false)
    List<Map<String, dynamic>> _messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text).toJson();
      } else {
        return Messages(role: Role.assistant, content: m.text).toJson();
      }
    }).toList();

    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: _messagesHistory,
      maxToken: 200,
    );

    try {
      final response = await _opedAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          setState(() {
            _messages.insert(
              0,
              ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content,
              ),
            );
          });
        }
      }
    } catch (e) {
      print("API error: $e");
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _gptChatUser,
            createdAt: DateTime.now(),
            text: "⚠️ API Error: Unable to get response.",
          ),
        );
      });
    }

    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }


}
