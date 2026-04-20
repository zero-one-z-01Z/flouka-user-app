import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../navbar/presentation/provider/nav_bar_provider.dart';
import '../../../products/presentation/providers/categories_product_search_provider.dart';
import 'delivery_dropdown_widget.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 1.h,
      ).copyWith(top: 7.h),
      child: Row(
        children: [
          const Expanded(child:  DeliveryDropdownWidget()),
          const Spacer(),
          InkWell(
              onTap: () {
                CategoriesProductSearchProvider provider = Provider.of(context,listen: false);
                provider.clearSearch();
              },
              child: const SvgWidget(svg: AppImages.search)),
          SizedBox(width: 4.w),
          InkWell(
            onTap: () {
              NavBarProvider navBarProvider = Provider.of(context,listen: false);
              navBarProvider.changeIndex(3);
            },
            child: const SvgWidget(svg: AppImages.cart),
          ),
        ],
      ),
    );
  }
}
