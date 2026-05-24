import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../products/presentation/providers/recommend_products_provider.dart';
import '../../../products/presentation/widgets/hot_deals_home_container_widget.dart';

class RecommendProductsWidget extends StatelessWidget {
  const RecommendProductsWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    final recommendProductsProvider = Provider.of<RecommendProductsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 28.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendProductsProvider.recommendedHomeList.length,
            itemBuilder: (context, index) {
              final product = recommendProductsProvider.recommendedHomeList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: HotDealsHomeContainerWidget(
                  product: product,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
