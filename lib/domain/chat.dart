import 'package:chatinho/domain/message.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String name;
  final Message? lastMessage;
  final int unreadMessages;
  final List<Message> messages;

  const Chat({
    required this.id,
    required this.name,
    this.lastMessage,
    this.unreadMessages = 0,
    this.messages = const [],
  });

  @override
  List<Object?> get props => [id];
}
