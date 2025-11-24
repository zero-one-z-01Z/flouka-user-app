import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/chat/presentation/providers/chat_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 0.6,
        backgroundColor: Colors.white,
        actions: [],
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.primaryColor,
              child: Image.asset(Images.preson, fit: BoxFit.cover),
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "عبد العزيز الحامد",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  LanguageProvider.translate('chat', 'online'),
                  style: TextStyle(fontSize: 13.sp, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount:
                  chatProvider.messages.length +
                  (chatProvider.isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (chatProvider.isTyping &&
                    index == chatProvider.messages.length) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(LanguageProvider.translate('chat', 'typing')),
                    ),
                  );
                }

                final message = chatProvider.messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),

          Container(
            color: Colors.white,
            width: 100.w,
            height: 12.h,
            child: ChatInput(
              controller: _controller,
              onSend: () => _sendMessage(context),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatProvider>().sendUserMessage(text);
      _controller.clear();
    }
  }
}
