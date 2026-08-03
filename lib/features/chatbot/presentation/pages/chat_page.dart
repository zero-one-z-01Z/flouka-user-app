import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/chatbot/domain/entities/chat_message.dart';
import 'package:flouka/features/chatbot/presentation/widgets/products_bot_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class ChatBotPage extends StatelessWidget {
  ChatBotPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatBotProvider>();

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(title: Text(LanguageProvider.translate('global', "smart_flouka",),),),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(controller: chatProvider.controllerList,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w,),
                  child: Builder(
                    builder: (context) {
                      if(chatProvider.messages.isEmpty){
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(height: 15.h,),
                              Image.asset(AppImages.AI,width: 50.w,),
                              SizedBox(height: 5.h,),
                              ButtonWidget(onTap: (){}, text: 'get_started',
                              width: 60.w,height: 6.h,),
                            ],
                          ),
                        );
                      }
                      return Wrap(
                        children: List.generate(chatProvider.messages.length +
                            (chatProvider.isTyping ? 1 : 0), (index) {
                          if (chatProvider.isTyping &&
                              index == chatProvider.messages.length) {
                            return const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("typing..."),
                              ),
                            );
                          }

                          final message = chatProvider.messages[index];
                          if(message is ChatMessage){
                            return ChatBubble(message: message);
                          }
                          return ProductsBotSection(products: message,);


                        } ,),
                      );
                    }
                  ),
                ),
              ),
            ),
            // Input
            Container(
              color: Colors.white,
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              // height: 12.h,
              child: ChatInput(
                controller: _controller,
                onSend: () => _sendMessage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatBotProvider>().sendUserMessage(text);
      _controller.clear();
    }
  }
}
