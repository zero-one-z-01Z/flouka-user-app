import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/address_entity.dart';
import '../providers/address_provider.dart';

class MyAddressWidget extends StatelessWidget {
  const MyAddressWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 1.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              spacing: 3.w,
              children: [
                const SvgWidget(svg: AppImages.location, color: Colors.black),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanguageProvider.translate("global", "Deliver To"),
                        style: TextStyleClass.smallStyle(
                          color: const Color(0xff535353),
                        ).copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        "${addressEntity.addressName} / ${addressEntity.address}",
                        style: TextStyleClass.smallStyle().copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
