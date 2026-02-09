import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_images.dart';
import '../views/stories_view.dart';

class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StoriesView()),
        );
      },
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff696DF3), width: 2),
        ),
        child: Center(child: Image.asset(AppImages.offer)),
      ),
    );
  }
}
