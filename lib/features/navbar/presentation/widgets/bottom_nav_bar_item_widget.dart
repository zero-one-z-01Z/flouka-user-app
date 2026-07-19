import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../domain/entities/bottom_nav_bar_entity.dart';

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({super.key, required this.bottomNaBarEntity});
  final BottomNaBarEntity bottomNaBarEntity;

  @override
  Widget build(BuildContext context) {
    NavBarProvider navBarProvider = Provider.of(context, listen: false);
    return InkWell(
      onTap: () {
        navBarProvider.changeIndex(bottomNaBarEntity.index);
      },
      child: Column(
        children: [
          SvgWidget(
            width: Constants.isTablet?30:24,
            // height: 24,
            svg: bottomNaBarEntity.svgImage,
            color: navBarProvider.currentIndex == bottomNaBarEntity.index
                ? AppColor.primaryColor
                : Colors.grey,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: Constants.isTablet?50:30,
            child: FittedBox(
              child: Text(
                bottomNaBarEntity.label,
                style: TextStyle(
                  fontSize: Constants.isTablet?17.sp: 13.sp,
                  color: navBarProvider.currentIndex == bottomNaBarEntity.index
                      ? AppColor.primaryColor
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
