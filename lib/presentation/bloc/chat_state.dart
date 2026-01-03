abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List messages;
  ChatLoaded(this.messages);
}
