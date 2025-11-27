import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DealsContainerWidget extends StatelessWidget {
  const DealsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 0.2.h,
      ).copyWith(left: 2.5.w, top: 1.h, bottom: 1.h),
      color: const Color(0xffD30F2D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageProvider.translate('home', 'craziest'),
                    style: TextStyleClass.normalStyle().copyWith(
                      color: const Color(0xffFFE202),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    LanguageProvider.translate('home', 'black_friday_deals'),
                    style: TextStyleClass.normalStyle().copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ButtonWidget(
                onTap: () {},
                text: 'shop_deals',
                color: Colors.black,
                borderRadius: 12,
                width: 25.w,
                height: 2.5.h,
                textStyle: TextStyleClass.smallStyle().copyWith(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
          const HotDealsHomeSection(showTitle: false),
        ],
      ),
    );
  }
}
