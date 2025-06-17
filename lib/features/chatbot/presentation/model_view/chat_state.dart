part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatUpdated extends ChatState {
  final List<ChatMessage> messages;
  ChatUpdated(this.messages);
}
