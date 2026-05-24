import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/story_provider.dart';
import 'story_item_widget.dart';

class StoriesListWidget extends StatelessWidget {
  const StoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var storyProvider = Provider.of<StoryProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:(storyProvider.data?.length ??0) >0?  2.h:0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 3.w,
        children: List.generate(
          storyProvider.data?.length??0,
              (index) => StoryItemWidget(storyEntity: storyProvider.data![index]),
        ),
      ),
    );
  }
}
