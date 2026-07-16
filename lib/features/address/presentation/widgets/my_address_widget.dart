import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/address_entity.dart';

class MyAddressWidget extends StatelessWidget {
  const MyAddressWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate("global", "delivery_to"),
          style: TextStyleClass.normalStyle()
        ),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.secondaryColor),
            color: AppColor.secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 1.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 3.w,
                  children: [
                    const SvgWidget(svg: AppImages.location, color: Colors.black),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${addressEntity.addressName}",
                            style: TextStyleClass.smallStyle(
                              color: const Color(0xff535353),
                            ).copyWith(fontSize: 14.sp),
                          ),
                          Text(
                            "${addressEntity.address}",maxLines: 1,
                            style: TextStyleClass.smallStyle().copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                          // Text(
                          //   "${addressEntity.neighborhoodEntity?.name??""} ${addressEntity.areaEntity !=null ?",":""} ${addressEntity.areaEntity?.name??""} ${addressEntity.cityEntity !=null ?",":""} ${addressEntity.cityEntity?.name??""}",
                          //   style: TextStyleClass.smallStyle().copyWith(
                          //     fontSize: 15.sp,
                          //   ),maxLines: 2,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
