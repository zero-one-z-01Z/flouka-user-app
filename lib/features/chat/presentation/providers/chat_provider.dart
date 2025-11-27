import 'package:flouka/features/chat/presentation/pages/ai_chat_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper_function/navigation.dart';

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class AIChat {
  final String? question;
  final String? answer;
  final String? image;

  AIChat({this.question, this.answer, this.image});
}

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];
  final List<AIChat> questions = [];
  final List<AIChat> images = [];
  bool _isTyping = false;

  void getData() {
    questions.clear();
    questions.addAll([
      AIChat(
        question: 'Do you have any upcoming occasions?',
        answer: 'Discover the products for graduation, anniversary, etc.',
      ),
      AIChat(
        question: 'Looking for everyday items?',
        answer: 'Check out our daily essentials collection.',
      ),
      AIChat(
        question: 'Need gift ideas?',
        answer: 'Find the perfect gift for your loved ones.',
      ),
      AIChat(
        question: 'What\'s trending now?',
        answer: 'See the most popular items this week.',
      ),
    ]);
  }

  void getImages() {
    images.add(
      AIChat(
        image:
            'https://imgs.search.brave.com/sReZV7WXi_dPyZC9ok6wKVsXe-qdxKhDe-KPP1mva8M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbnNjb3V0LmNv/bS9pY29uL3ByZW1p/dW0vcG5nLTI1Ni10/aHVtYi9hcnRpZmlj/aWFsLWludGVsbGln/ZW5jZS1pY29uLXN2/Zy1kb3dubG9hZC1w/bmctMjcwNDMwMC5w/bmc_Zj13ZWJwJnc9/MTI4',
      ),
    );
  }

  List<Message> get messages => _messages;
  bool get isTyping => _isTyping;

  void sendUserMessage(String text) {
    if (text.trim().isEmpty) return;

    _messages.add(Message(text: text, isUser: true));
    notifyListeners();

    _simulateBotReply(text);
  }

  void goToChatPage() {
    navP(AIChatPage());
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
