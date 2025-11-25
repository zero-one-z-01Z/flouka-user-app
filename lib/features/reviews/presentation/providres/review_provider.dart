import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/reviews/presentation/views/review_view.dart';
import 'package:flutter/material.dart';

class ReviewProvider extends ChangeNotifier {
  void gotoReviewPage() {
    navP(const ReviewView());
  }
  final PageController pageController = PageController();
}
