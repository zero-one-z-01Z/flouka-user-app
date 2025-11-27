import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/chat_provider.dart';

class ChatSuggestionsWidget extends StatelessWidget {
  const ChatSuggestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    // 1. Wrap in Container to give the horizontal ListView a constrained height
    return Container(
      height: 12.h,
      child: ListView.builder(
        // shrinkWrap: true is generally not needed when the list is constrained by a height
        scrollDirection: Axis.horizontal,
        itemCount: chatProvider.questions.length,
        itemBuilder: (context, index) {
          final suggestion = chatProvider.questions[index];

          return Padding(
            // Adds padding between items
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: 8,
              top: 5,
              bottom: 5,
            ),

            // Added InkWell to make the suggestion tappable
            child: InkWell(
              onTap: () {
                // Tapping a suggestion sends its question as a message
                context.read<ChatProvider>().sendUserMessage(
                  suggestion.question!,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffF4F7FD),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1.0),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suggestion.question!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      suggestion.answer!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
