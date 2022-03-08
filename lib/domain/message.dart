import 'package:chatinho/domain/user.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String id;
  final String text;
  final User sender;
  final DateTime time;
  final MessageType type;
  final MessageState state;
  final Map<String, dynamic> metadata;
  Message({
    required this.id,
    required this.text,
    required this.sender,
    DateTime? time,
    this.type = MessageType.text,
    this.state = MessageState.sent,
    this.metadata = const {},
  }) : time = time ?? DateTime.now();

  @override
  List<Object?> get props => [id];

  Message copyWith({
    String? id,
    String? text,
    User? sender,
    DateTime? time,
    MessageType? type,
    MessageState? state,
    Map<String, dynamic>? metadata,
  }) =>
      Message(
        id: id ?? this.id,
        text: text ?? this.text,
        sender: sender ?? this.sender,
        time: time ?? this.time,
        type: type ?? this.type,
        state: state ?? this.state,
        metadata: metadata ?? this.metadata,
      );
}

enum MessageState {
  sending,
  sent,
  delivered,
  read,
  error,
}

enum MessageType {
  text,
  image,
  file,
}
