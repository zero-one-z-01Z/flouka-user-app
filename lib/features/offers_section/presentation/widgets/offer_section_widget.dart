import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';
import 'package:flouka/features/products/presentation/providers/categories_product_search_provider.dart';
import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                      color: offerSectionEntity.titleColor ?? Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    offerSectionEntity.description,
                    style: TextStyleClass.normalStyle().copyWith(
                      color: offerSectionEntity.descriptionColor ?? Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if(offerSectionEntity.buttonText.isNotEmpty)
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Provider.of<CategoriesProductSearchProvider>(context, listen: false).goToPage({
                        "section_id":offerSectionEntity.id
                      });
                    },
                    child: Container(
                      padding:EdgeInsets.all(1.w),
                      decoration: BoxDecoration(
                        color: offerSectionEntity.buttonColor ?? Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("${offerSectionEntity.buttonText}",maxLines: 2,
                          style: TextStyleClass.smallStyle(color:offerSectionEntity.buttonTextColor ?? Colors.white,),
                        ),
                      ),
                    ),
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
