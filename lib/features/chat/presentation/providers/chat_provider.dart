import 'package:flouka/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_function/navigation.dart';

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];
  bool _isTyping = false;

  List<Message> get messages => _messages;
  bool get isTyping => _isTyping;

  void sendUserMessage(String text) {
    if (text.trim().isEmpty) return;

    _messages.add(Message(text: text, isUser: true));
    notifyListeners();

    _simulateBotReply(text);
  }

  void goToChatPage() {
    navP(ChatPage());
  }

  Future<void> _simulateBotReply(String userText) async {
    _isTyping = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _messages.add(Message(text: "$userText", isUser: false));
    _isTyping = false;
    notifyListeners();
  }
}
