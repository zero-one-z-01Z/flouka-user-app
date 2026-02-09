import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'story_item_widget.dart';

class StoriesListWidget extends StatelessWidget {
  const StoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              spacing: 3.w,
              children: List.generate(10, (index) => const StoryItemWidget()),
            ),
          ),
        ],
      ),
    );
  }
}
