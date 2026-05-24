import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../providers/store_reviews_provider.dart';
import 'review_container_widget.dart';

class AllReviewsContainer extends StatelessWidget {
  const AllReviewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewsProvider = Provider.of<StoreReviewsProvider>(context);
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 1.h),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate("global", "reviews"),
                style: TextStyleClass.normalStyle(),
              ),
              SizedBox(height: 1.h),
              // List of review widgets
              Builder(
                  builder: (context) {
                    if(reviewsProvider.data==null){
                      return const Center(child:LoadingAnimationWidget(gif: Lotties.loading,));
                    }else if(reviewsProvider.data!.isEmpty){
                      return const Center(child:EmptyAnimation(gif: Lotties.noSearch,title: "",));
                    }
                    return Wrap(
                      children: List.generate(reviewsProvider.data!.length, (index) {
                        return ReviewContainerWidget(
                          review: reviewsProvider.data![index],
                        );
                      },),
                    );
                  }
              ),

            ],
          ),
        );
      },
    );
  }
}
