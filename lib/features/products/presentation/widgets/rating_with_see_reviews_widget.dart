
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/product_entity.dart';

class RatingWithSeeReviewsWidget extends StatelessWidget {
  const RatingWithSeeReviewsWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomStarRatingWidget(itemSize: 20.sp, rating: product.rate ?? 0, readOnly: true,),
        SizedBox(width: 2.w),
        Text("${ product.rate ?? 0}", style: TextStyleClass.normalStyle(color: Colors.grey)),
        const Spacer(),
        Text(
          LanguageProvider.translate("global", "see reviews"),
          style: TextStyleClass.normalStyle(color: Colors.grey),
        ),
        SizedBox(width: 2.w),
        Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15.sp),
      ],
    );
  }
}
