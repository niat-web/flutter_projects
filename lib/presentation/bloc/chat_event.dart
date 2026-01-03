abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final String text;
  SendMessage(this.text);
}

class SyncPendingMessagesEvent extends ChatEvent {}

class ListenMessagesEvent extends ChatEvent {}

class MessagesUpdatedEvent extends ChatEvent {
  final List messages;
  MessagesUpdatedEvent(this.messages);
}

