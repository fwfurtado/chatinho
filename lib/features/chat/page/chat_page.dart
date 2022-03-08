import 'package:chatinho/features/chat/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/messages.dart';

class ChatPage extends ConsumerWidget {
  final String id;

  const ChatPage({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageUIProvider);
    final user = ref.watch(currentUIUser);
    return Scaffold(
      body: SafeArea(
        child: Chat(
          emojiEnlargementBehavior: EmojiEnlargementBehavior.single,
          emptyState: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('No messages yet'),
                  SizedBox(height: 8),
                  Text('Send a message to start chatting'),
                ],
              ),
            ),
          ),
          showUserNames: true,
          showUserAvatars: true,
          hideBackgroundOnEmojiMessages: true,
          onMessageTap: _handleMessageTap,
          onEndReached: _handleEndReached,
          onEndReachedThreshold: 1,
          groupMessagesThreshold: const Duration(minutes: 5).inMilliseconds,
          usePreviewData: true,
          user: user,
          messages: messages,
          onSendPressed: (message) {},
        ),
      ),
    );
  }

  Future<void> _handleMessageTap(
      BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      debugPrint('Opening file: ${message.uri}');
      await launch(message.uri);
    }
  }

  Future<void> _handleEndReached() async {
    debugPrint('End reached');
    await Future.delayed(const Duration(seconds: 5));
  }
}
