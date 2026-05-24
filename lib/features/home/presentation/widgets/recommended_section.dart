import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/see_all_button.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../products/presentation/providers/recommend_products_provider.dart';
import 'recommend_products_widget.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendProductsProvider = Provider.of<RecommendProductsProvider>(context);
    return recommendProductsProvider.recommendedHomeList.isNotEmpty ? Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 0.2.h,
      ).copyWith(left: 2.5.w, top: 1.h, bottom: 1.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguageProvider.translate('home', 'recommended'),
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SeeAllButton(onPressed: (){
                    recommendProductsProvider.goToPage();
                  },),
                ],
              ),
            ),
          ),
          const RecommendProductsWidget(),
        ],
      ),
    ) : Container();
  }
}
