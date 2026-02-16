import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';
import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OffersSectionWidget extends StatelessWidget {
  const OffersSectionWidget({super.key, required this.offerSectionEntity});
  final OfferSectionEntity offerSectionEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 0.2.h,
      ).copyWith(left: 2.5.w, top: 1.h, bottom: 1.h),
      color: offerSectionEntity.color,
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
                    offerSectionEntity.title,
                    style: TextStyleClass.normalStyle().copyWith(
                      color: const Color(0xffFFE202),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    offerSectionEntity.description,
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
          HotDealsHomeSection(products: offerSectionEntity.products),
        ],
      ),
    );
  }
}
