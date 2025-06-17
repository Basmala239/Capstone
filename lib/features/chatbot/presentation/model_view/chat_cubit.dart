import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/chat_message_model.dart';
import '../../data/repository/chat_repository.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    _messages.add(ChatMessage(message: text, isUser: true));
    emit(ChatUpdated(List.from(_messages)));

    final botReply = await sendChatMessage(text);

    _messages.add(ChatMessage(message: botReply, isUser: false));
    emit(ChatUpdated(List.from(_messages)));
  }
}
