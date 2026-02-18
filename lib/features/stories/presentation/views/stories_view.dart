import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:story_view/story_view.dart";

import '../../domain/entity/story_entity.dart';
import '../provider/story_provider.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.story});
  final StoryEntity story;
  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);

    // List<StoryItem> storyItems = [
    //   StoryItem.pageImage(url: AppImages.fakeImageStory, controller: controller),
    //   StoryItem.pageVideo(
    //     "https://veda-crumblier-sparkishly.ngrok-free.dev/uploads/stories/4ac4ebbb-c1d2-4b9d-9e24-bd7a1632277d.mp4",
    //     controller: controller,
    //   ),
    //   StoryItem.pageImage(url: AppImages.fakeImageStory, controller: controller),
    //   StoryItem.text(
    //     backgroundColor: Colors.purple,
    //     title:
    //         'We had a fight on Saturday evening, two years have passed, and Sunday morning has not come.',
    //   ),
    // ]; //
    return Scaffold(
      body: StoryView(
        progressPosition: ProgressPosition.top,
        inline: true,
        indicatorColor: Colors.white.withValues(alpha: .2),
        storyItems: [],
        repeat: false,
        controller: storyProvider.controller,
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
        onComplete: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
