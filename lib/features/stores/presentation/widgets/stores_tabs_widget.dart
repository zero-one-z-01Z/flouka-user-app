import 'package:flouka/core/widgets/animation/slide_transition_widget.dart';
import 'package:flouka/features/stores/presentation/widgets/all_reviews_container.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/stores/presentation/providers/stores_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import 'store_products_widget.dart';

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
                InkWell(
                  onTap: () {
                    storesProvider.changeCurrent(0);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      StoresTabsWidget.titles.length,
                      (index) => GestureDetector(
                        onTap: () {
                          storesProvider.changeCurrent(index);
                        },
                        child: Container(width: 40.w,
                          padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99999),
                            color: storesProvider.current == index
                                ? AppColor.secondaryColor
                                : Colors.transparent,
                          ),

                          child: Center(
                            child: Text(
                              LanguageProvider.translate("global", StoresTabsWidget.titles[index],),
                              style: TextStyleClass.normalStyle().copyWith(
                                color: storesProvider.current == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // PageView for tab content
          SlideTransitionWidget(
            child: AnimatedContainer(
              key: ValueKey(storesProvider.current),
              duration: const Duration(milliseconds: 300),
              child: storesProvider.current == 0
                  ? const StoreProductsWidget()
                  : const AllReviewsContainer(),
            ),
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}
