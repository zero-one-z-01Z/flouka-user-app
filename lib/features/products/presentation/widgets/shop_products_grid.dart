import 'package:flouka/features/products/presentation/providers/products_provider.dart';
import 'package:flouka/features/products/presentation/widgets/suggested_products_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'hot_deals_home_container_widget.dart';

class ShopProductsGrid extends StatelessWidget {
  const ShopProductsGrid({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    final hotDeals = provider.hotDeals;

    return SingleChildScrollView(
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: 3.h, bottom: 4.h),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2.h,
          crossAxisSpacing: 0.w,
          children: [
            for (int i = 0; i < hotDeals.length; i++) ...[
              StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: Builder(
                  builder: (context) {
                    // Fixed image height
                    final imageHeight = 12.h;

                    // Apply top padding to every right item (odd index)
                    double topPadding = (i % 2 == 1) ? 2.h : 0;

                    return Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child: HotDealsHomeContainerWidget(
                        madeIn: false,
                        imageUrl: hotDeals[i].image ?? '',
                        title: hotDeals[i].title ?? '',
                        priceAfterOffer: (hotDeals[i].offerPrice ?? 0).toDouble(),
                        priceBeforeOffer: (hotDeals[i].price ?? 0).toDouble(),
                        rating: hotDeals[i].avgRating ?? 0.0,
                        imageHeight: imageHeight,
                      ),
                    );
                  },
                ),
              ),
              if (i == 3)
                const StaggeredGridTile.fit(
                  crossAxisCellCount: 4,
                  child: SuggestedProductsSection(),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
