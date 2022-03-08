import 'package:chatinho/domain/message.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'user.dart' as user_adapter;

List<types.Message> fromDomain(Message message) {
  switch (message.type) {
    case MessageType.text:
      return [_buildTextMessage(message)];
    case MessageType.image:
      return _buildImageMessage(message);
    case MessageType.file:
      return _buildFileMessage(message);
  }
}

List<types.Message> _buildFileMessage(Message message) {
  return [
    types.FileMessage(
      id: message.id,
      author: user_adapter.fromDomain(message.sender),
      status: convert(message.state),
      createdAt: message.time.millisecondsSinceEpoch,
      name: message.metadata['filename'],
      uri: message.metadata['location'],
      size: message.metadata['size'],
      mimeType: message.metadata['mimeType'],
    ),
    if (message.text.isNotEmpty) _buildTextMessage(message),
  ];
}

List<types.Message> _buildImageMessage(Message message) {
  return [
    types.ImageMessage(
      id: message.id,
      author: user_adapter.fromDomain(message.sender),
      status: convert(message.state),
      createdAt: message.time.millisecondsSinceEpoch,
      name: message.metadata['filename'],
      uri: message.metadata['location'],
      size: message.metadata['size'],
    ),
    if (message.text.isNotEmpty) _buildTextMessage(message),
  ];
}

types.TextMessage _buildTextMessage(Message message) {
  return types.TextMessage(
    id: message.id,
    text: message.text,
    author: user_adapter.fromDomain(message.sender),
    status: convert(message.state),
    createdAt: message.time.millisecondsSinceEpoch,
  );
}

types.Status convert(MessageState status) {
  switch (status) {
    case MessageState.sending:
      return types.Status.sending;
    case MessageState.sent:
      return types.Status.sent;
    case MessageState.delivered:
      return types.Status.delivered;
    case MessageState.read:
      return types.Status.seen;
    case MessageState.error:
      return types.Status.error;
  }
}
