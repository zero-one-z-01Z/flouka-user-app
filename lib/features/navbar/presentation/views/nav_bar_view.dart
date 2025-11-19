import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/svg_widget.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(
      builder: (context, nav, _) {
        return Scaffold(
          body: nav.body[nav.currentIndex],
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  child: GNav(
                    gap: 8,
                    rippleColor: Colors.grey[200]!,
                    hoverColor: Colors.grey[100]!,
                    activeColor: AppColor.primaryColor,
                    color: AppColor.tertiaryColor,
                    tabBackgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    selectedIndex: nav.currentIndex,
                    onTabChange: nav.changeIndex,
                    tabs: [
                      for (
                        int i = 0;
                        i < nav.bottomNavigationBarItemEntity.length;
                        i++
                      )
                        () {
                          final item = nav.bottomNavigationBarItemEntity[i];
                          final bool isSelected = nav.currentIndex == i;
                          final Color iconColor = isSelected
                              ? AppColor.primaryColor
                              : AppColor.tertiaryColor;

                          return GButton(
                            leading: SvgWidget(
                              svg: item.svgImage,
                              color: iconColor,
                            ),
                            icon: Icons.circle, // not used when leading is set
                            text: item.label,
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColor.primaryColor
                                  : AppColor.tertiaryColor,
                            ),
                          );
                        }(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
