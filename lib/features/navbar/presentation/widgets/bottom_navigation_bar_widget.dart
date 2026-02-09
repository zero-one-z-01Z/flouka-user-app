import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../provider/nav_bar_provider.dart';
import 'bottom_nav_bar_item_widget.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(
      builder: (context, nav, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(
                    4.w,
                  ).add(const EdgeInsetsGeometry.only(bottom: 12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      nav.bottomNavigationBarItemEntity.length,
                      (index) {
                        if (index == 2) {
                          return const SizedBox();
                        }
                        return BottomNavBarItemWidget(
                          bottomNaBarEntity:
                              nav.bottomNavigationBarItemEntity[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            // BottomNavigationBar(
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            //   selectedItemColor: AppColor.primaryColor,
            //   unselectedItemColor: Colors.grey,
            //   selectedLabelStyle: TextStyle(
            //     fontSize: 13.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   unselectedLabelStyle: TextStyle(
            //     fontSize: 13.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   type: BottomNavigationBarType.fixed,
            //   items: nav.bottomNavigationBarItemEntity.map((item) {
            //     if (item.svgImage.isEmpty) {
            //       return const BottomNavigationBarItem(
            //         icon: SizedBox.shrink(),
            //         label: '',
            //       );
            //     }
            //     return BottomNavigationBarItem(
            //       activeIcon: SvgWidget(
            //         width: 24,
            //         height: 24,
            //         svg: item.svgImage,
            //         color: AppColor.primaryColor,
            //       ),
            //       icon: SvgWidget(
            //         width: 24,
            //         height: 24,
            //         svg: item.svgImage,
            //         color: Colors.grey,
            //       ),
            //       label: item.label,
            //     );
            //   }).toList(),
            //   currentIndex: nav.currentIndex,
            //   onTap: nav.changeIndex,
            // ),
            Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 7.w,
                child: Image.asset(AppImages.vedio),
              ),
            ),
          ],
        );
      },
    );
  }
}
