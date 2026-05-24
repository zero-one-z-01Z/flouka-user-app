import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../../core/config/app_styles.dart';
import '../../domain/entity/story_entity.dart';
import '../provider/story_provider.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.story});
  final StoryEntity story;

  @override
  Widget build(BuildContext context) {
    final storyProvider = context.read<StoryProvider>();

    final List<StoryItem> storyItems = story.stories.map((storyItem) {
      // switch (storyItem.type) {
        // case "video":
        //   return StoryItem.pageVideo(
        //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        //     controller: storyProvider.controller,
        //   );

        // case "image":
          return StoryItem.pageImage(
            url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUT2jLYoIC9Lg65AVA5KhEUdJdWFm0-vznZg&s",
            controller: storyProvider.controller,
          );

        // default:
        //   return StoryItem.text(
        //     title: "Unsupported story type",
        //     backgroundColor: Colors.black,
        //   );
      // }
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              return StoryView(
                progressPosition: ProgressPosition.top,
                inline: true,
                indicatorColor: Colors.white.withValues(alpha: .2),
                storyItems: storyItems,
                repeat: false,
                controller: storyProvider.controller,
                onStoryShow: (storyItem, index) async{
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    storyProvider.setIndex(index);
                  });              },
                onVerticalSwipeComplete: (direction) {
                  if (direction == Direction.down) {
                    Navigator.pop(context);
                  }
                },
                onComplete: () {
                  Navigator.pop(context);
                },
              );
            }
          ),
          Positioned(
            bottom: 10.h,right: 0,left: 0,
            child: Selector<StoryProvider, int>(
              selector: (_, provider) => provider.currentIndex,
              builder: (context, currentIndex, _) {
                return GestureDetector(
                  onTap: (){
                    Provider.of<ProductDetailsProvider>(context, listen: false).goToPage({
                      "product_id":story.stories[storyProvider.currentIndex].productId,
                    });
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.keyboard_double_arrow_up,size: 20.sp,color: Colors.white,),
                          SizedBox(width: 2.w),
                          Text(story.stories[storyProvider.currentIndex].title,
                            style: TextStyleClass.normalStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
