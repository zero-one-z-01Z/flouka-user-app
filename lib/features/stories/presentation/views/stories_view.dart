import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../domain/entity/story_entity.dart';
import '../provider/story_provider.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.story});
  final StoryEntity story;

  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);

    final List<StoryItem> storyItems = story.stories.map((storyItem) {
      switch (storyItem.type) {
        case "video":
          return StoryItem.pageVideo(
            storyItem.path,
            controller: storyProvider.controller,
          );

        case "image":
          return StoryItem.pageImage(
            url: storyItem.path,
            controller: storyProvider.controller,
          );

        default:
          return StoryItem.text(
            title: "Unsupported story type",
            backgroundColor: Colors.black,
          );
      }
    }).toList();

    return Scaffold(
      body: StoryView(
        progressPosition: ProgressPosition.top,
        inline: true,
        indicatorColor: Colors.white.withValues(alpha: .2),
        storyItems: storyItems,
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
