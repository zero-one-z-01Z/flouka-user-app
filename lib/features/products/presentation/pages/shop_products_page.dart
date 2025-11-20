import 'package:flouka/features/products/presentation/widgets/shop_products_page_filter.dart';
import 'package:flouka/features/products/presentation/widgets/shop_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../categories/presentation/widgets/searchbar_container.dart';

class ShopProductsPage extends StatelessWidget {
  const ShopProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            Row(
              children: [
                const Expanded(child: SearchbarContainer()),
                SizedBox(width: 2.w),
                Container(
                  width: 12.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xff221F1F).withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: SvgWidget(
                      svg: Images.filter,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            const ShopProductsPageFilter(),
            SizedBox(height: 2.h),
            const Expanded(child: ShopProductsGrid()),
          ],
        ),
      ),
    );
  }
}
