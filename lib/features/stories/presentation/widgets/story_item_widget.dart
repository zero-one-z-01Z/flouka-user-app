import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../views/stories_view.dart';

class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget({super.key, required this.storyEntity});
  final StoryEntity storyEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoriesView(story: storyEntity)),
        );
      },
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(storyEntity.logo),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: const Color(0xff696DF3), width: 2),
        ),
      ),
    );
  }
}
