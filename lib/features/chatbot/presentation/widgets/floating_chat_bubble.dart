import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../pages/chat_page.dart';
import '../providers/chat_provider.dart';

class FloatingChatBubble extends StatefulWidget {
  const FloatingChatBubble({super.key});

  @override
  State<FloatingChatBubble> createState() => FloatingChatBubbleState();
}

class FloatingChatBubbleState extends State<FloatingChatBubble>
    with SingleTickerProviderStateMixin {
  Offset position = const Offset(20, 200);
  bool isChatOpen = false;
  late Size screenSize;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateToEdge() {
    final screenWidth = screenSize.width;
    const bubbleWidth = 60.0;

    final targetX = (position.dx + bubbleWidth / 2 > screenWidth / 2)
        ? screenWidth - bubbleWidth - 10
        : 10.0;

    final double targetY = position.dy.clamp(80, screenSize.height - 120);

    _animation = Tween<Offset>(
      begin: position,
      end: Offset(targetX, targetY),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _animation.addListener(() {
      setState(() {
        position = _animation.value;
      });
    });

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    // 🧩 Detect keyboard height
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    // Adjust position if keyboard is open
    double adjustedTop = position.dy;
    if (keyboardHeight > 0 && isChatOpen) {
      adjustedTop = (position.dy - keyboardHeight * 0.6).clamp(
        0,
        screenSize.height - 300,
      );
    }

    return Stack(
      children: [
        // 🪟 Chat window
        if (isChatOpen)
          Positioned(
            left: position.dx > screenSize.width / 2
                ? position.dx - 310
                : position.dx + 60,
            top: adjustedTop - 100,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  position += details.delta;
                });
              },
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 75.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Chat",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () =>
                                  setState(() => isChatOpen = false),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: ChatBotPage()),
                    ],
                  ),
                ),
              ),
            ),
          ),

        // 💬 Floating bubble
        Positioned(
          left: position.dx,
          top: adjustedTop,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position += details.delta;
              });
            },
            onPanEnd: (_) => _animateToEdge(),
            onTap: () {
              Provider.of<ChatBotProvider>(context,listen: false).goToChatBotPage();
              // setState(() {
              //   isChatOpen = !isChatOpen;
              // });
            },
            child: Material(
              elevation: 6,
              shape:  CircleBorder(),
              child: Image.asset(AppImages.AI,width: 10.w,),
            ),
          ),
        ),
      ],
    );
  }
}
