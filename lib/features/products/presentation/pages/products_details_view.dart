import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flouka/features/products/presentation/widgets/gradiant_button.dart';
import 'package:flouka/features/products/presentation/widgets/product_details_header_widget.dart';
import 'package:flouka/features/products/presentation/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/products_details_provider.dart';
import '../widgets/avg_rating_widget.dart';
import '../widgets/frequently_list_widget.dart';
import '../widgets/review_with_images_section.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              productDetailsProvider.data !=null?
              "${productDetailsProvider.data?.title??""}":
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
                    ProductDetailsHeaderWidget(productEntity: productDetailsProvider.data!,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            productDetailsProvider.data!.title!,
                            style: TextStyleClass.headStyle(color: Colors.grey.shade400),
                          ),
                          SizedBox(height: 2.h),
                          // const RatingWithSeeReviewsWidget(),
                          // SizedBox(height: 2.5.h),
                          Text(
                            LanguageProvider.translate("global", "Description"),
                            style: TextStyleClass.headStyle(),
                          ),
                          Text(
                            productDetailsProvider.data!.description!,
                            style: TextStyleClass.normalStyle(
                              color: Colors.grey.shade400,
                            ).copyWith(height: 2),
                          ),
                          SizedBox(height: 3.h),
                          if(productDetailsProvider.data!.related.isNotEmpty)
                            ...[
                              Text(
                                LanguageProvider.translate(
                                  "global",
                                  "Frequently Bought Together",
                                ),
                                style: TextStyleClass.normalStyle(),
                              ),
                              SizedBox(height: 2.h),
                              FrequentlyListWidget(relatedProducts: productDetailsProvider.data!.related),
                              SizedBox(height: 2.h),
                            ],
                          Text(
                            LanguageProvider.translate(
                              "global",
                              "Proudact Reating & Reviwes",
                            ),
                            style: TextStyleClass.normalStyle(),
                          ),
                          SizedBox(height: 2.h),
                          AvgRatingWidget(rating: productDetailsProvider.data!.avgRating??0,),
                          SizedBox(height: 2.h),
                          if(productDetailsProvider.data!.reviewImages.isNotEmpty)...[
                            ReviewWithImagesSection(reviewImages: productDetailsProvider.data!.reviewImages),
                            SizedBox(height: 2.h),
                          ],
                          Wrap(children: List.generate(productDetailsProvider.data!.reviews.length,
                                (index) =>ReviewItemWidget(review: productDetailsProvider.data!.reviews[index],) ,),),
                          SizedBox(height: 2.h),

                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 7.h,
                      color: const Color(0xffeffbff),
                      child: gradiantButton(
                        vendor: productDetailsProvider.data!.vendor!,
                        onTap: () {},
                        gradiantcolors: [Colors.white, AppColor.primaryColor],
                      ),
                    ),
                    SizedBox(height: 5.h),
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
