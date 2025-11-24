import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flouka/features/products/presentation/widgets/product_details_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/products_details_provider.dart';
import '../widgets/rating_with_see_reviews_widget.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageProvider.translate("global", "What are you looking for ?"),
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Builder(
            builder: (context) {
              if (productDetailsProvider.data == null) {
                return const Center(
                  child: LoadingAnimationWidget(gif: Lotties.loading),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const ProductDetailsHeaderWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            productDetailsProvider.data!.name!,
                            style: TextStyleClass.headStyle(),
                          ),
                          SizedBox(height: 2.h),
                          const RatingWithSeeReviewsWidget(),
                          SizedBox(height: 2.5.h),
                          Text(
                            LanguageProvider.translate("global", "Description"),
                            style: TextStyleClass.headStyle(),
                          ),
                          Text(
                            productDetailsProvider.data!.description!,
                            style: TextStyleClass.normalStyle(
                              color: const Color(0xffaeb1c1),
                            ).copyWith(height: 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
