import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/config/app_color.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/products_details_provider.dart';

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
              return Column(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: productDetailsProvider.pageController,
                          itemCount: productDetailsProvider.data!.images!.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  productDetailsProvider.data!.images![index]!.image,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          child: const Center(
                            child: CustomProductDetailsDotsIndicators(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomProductDetailsDotsIndicators extends StatelessWidget {
  const CustomProductDetailsDotsIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return SmoothPageIndicator(
      controller: productDetailsProvider.pageController,
      count: productDetailsProvider.data!.images!.length,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
        spacing: 8.0,
        radius: 60,
        dotWidth: 10,
        dotHeight: 10.0,
        dotColor: Colors.grey.shade300,
        activeDotColor: AppColor.primaryColor,
      ),
    );
  }
}
