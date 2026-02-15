import 'package:flouka/features/products/presentation/widgets/shop_products_grid.dart';
import 'package:flouka/features/stores/presentation/widgets/all_reviews_container.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/stores/presentation/providers/stores_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';

class StoresTabsWidget extends StatefulWidget {
  const StoresTabsWidget({super.key});

  static const List<String> titles = ["products", "reviews"];

  @override
  State<StoresTabsWidget> createState() => _StoresTabsWidgetState();
}

class _StoresTabsWidgetState extends State<StoresTabsWidget> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<StoresProvider>();
    _pageController = PageController(initialPage: provider.current);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storesProvider = context.watch<StoresProvider>();

    // Sync PageController when provider.current changes via tab tap
    if (_pageController.hasClients &&
        _pageController.page?.round() != storesProvider.current) {
      _pageController.animateToPage(
        storesProvider.current,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w).copyWith(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      StoresTabsWidget.titles.length,
                      (index) => GestureDetector(
                        onTap: () {
                          storesProvider.changeCurrent(index);
                        },
                        child: Text(
                          LanguageProvider.translate(
                            "global",
                            StoresTabsWidget.titles[index],
                          ),
                          style: TextStyleClass.normalStyle().copyWith(
                            color: storesProvider.current == index
                                ? AppColor.primaryColor
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Indicator bar
                Container(
                  alignment: storesProvider.current == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: 100.w,
                  height: 1.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffdddddd),
                  ),
                  child: Container(
                    height: 1.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // PageView for tab content
          SizedBox(
            height: 50.h,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                storesProvider.changeCurrent(index);
              },
              children: const [
                // Placeholder widgets for each tab
                ShopProductsGrid(),
                AllReviewsContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
