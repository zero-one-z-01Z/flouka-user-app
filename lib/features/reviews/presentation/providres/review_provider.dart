import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/reviews/presentation/views/review_view.dart';
import 'package:flutter/material.dart';

import '../../../products/domain/entity/product_review_entity.dart';

class ReviewProvider extends ChangeNotifier {
  void gotoReviewPage({required ProductReviewEntity review}) {
    navP( ReviewView(review: review,));
  }
  final PageController pageController = PageController();
}
