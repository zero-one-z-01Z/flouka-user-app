import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/stores/presentation/providers/reviews_provider.dart';
import 'package:sizer/sizer.dart';
import 'review_container_widget.dart';

class AllReviewsContainer extends StatelessWidget {
  const AllReviewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ReviewsProvider>(
        context,
        listen: false,
      ).loadReviews(),
      builder: (context, snapshot) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              // List of review widgets
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Provider.of<ReviewsProvider>(context).reviews.length,
                itemBuilder: (context, index) {
                  // For now, ReviewContainerWidget does not accept data, so we reuse it as a static card.
                  // In future it can be extended to accept a ReviewEntity.
                  return ReviewContainerWidget(
                    review: Provider.of<ReviewsProvider>(
                      context,
                    ).reviews[index],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
