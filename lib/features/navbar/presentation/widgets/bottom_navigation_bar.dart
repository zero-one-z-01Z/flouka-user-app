import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../provider/nav_bar_provider.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(
      builder: (context, nav, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.white,
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                items: nav.bottomNavigationBarItemEntity.map((item) {
                  if (item.svgImage.isEmpty) {
                    return const BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      label: '',
                    );
                  }
                  return BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgWidget(
                        width: 16,
                        height: 16,
                        svg: item.svgImage,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    icon: SvgWidget(
                      width: 16,
                      height: 16,
                      svg: item.svgImage,
                      color: Colors.grey,
                    ),
                    label: item.label,
                  );
                }).toList(),
                currentIndex: nav.currentIndex,
                onTap: nav.changeIndex,
              ),
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
          ),
        );
      },
    );
  }
}
