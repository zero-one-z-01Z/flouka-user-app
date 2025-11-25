import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providres/review_provider.dart';
import '../widgets/images_page_view_builder.dart';
import '../widgets/rating_bottom_sheet_widget.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            const ImagesPageViewBuilder(),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RatingBottomSheetWidget(),
            ),
            Positioned(
              left: 4.w,
              top: 35.h,
              child: InkWell(
                onTap: () {
                  reviewProvider.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 6,
                    bottom: 6,
                    right: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 4.w,
              top: 35.h,
              child: InkWell(
                onTap: () {
                  reviewProvider.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    right: 6,
                    top: 6,
                    bottom: 6,
                    left: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
