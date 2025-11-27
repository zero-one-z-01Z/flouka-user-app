import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/chat/presentation/providers/chat_provider.dart';
import 'package:flouka/features/chat/presentation/widgets/chat_suggestions_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class AIChatPage extends StatelessWidget {
  AIChatPage({super.key});

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
        title: Text(
          LanguageProvider.translate('chat', 'ai_chat'),
          style: TextStyleClass.normalStyle().copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          // Initialize data if not already done
          if (chatProvider.images.isEmpty) {
            chatProvider.getImages();
            chatProvider.getData();
          }

          if (chatProvider.messages.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  if (chatProvider.messages.isEmpty)
                    // CachedNetworkImage(
                    //   imageUrl: chatProvider.images.first.image!,
                    //   placeholder: (context, url) =>
                    //       const CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) =>
                    //       const Icon(Icons.error),
                    //   width: 60.w,
                    //   height: 60.h,
                    //   fit: BoxFit.contain,
                    // ),
                    Image.asset('assets/images/home/ai.png'),
                  SizedBox(height: 1.h),
                  ButtonWidget(
                    width: 55.w,
                    onTap: () {},
                    text: LanguageProvider.translate('chat', 'start'),
                    textStyle: TextStyleClass.normalStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  const ChatSuggestionsWidget(),
                  SizedBox(height: 1.h),
                  Container(
                    color: Colors.white,
                    width: 100.w,
                    height: 12.h,
                    child: ChatInput(
                      controller: _controller,
                      onSend: () => _sendMessage(context),
                      title: "ask_me",
                    ),
                  ),
                ],
              ),
            );
          } else
            return Column(
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
                            child: Text(
                              LanguageProvider.translate('chat', 'typing'),
                            ),
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
                    title: 'ask_me',
                  ),
                ),
              ],
            );
        },
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
