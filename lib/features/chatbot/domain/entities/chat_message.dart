enum ChatRole { user, bot }

class ChatMessage {
  final ChatRole role;
  final String text;
  final DateTime time;

  ChatMessage({required this.role, required this.text, DateTime? time})
    : time = time ?? DateTime.now();
}
