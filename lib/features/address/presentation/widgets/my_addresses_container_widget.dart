import 'package:flouka/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/widgets/radio_widget.dart';
import '../../../../../core/widgets/svg_widget.dart';
import '../../domain/entities/address_entity.dart';

class MyAddressesContainerWidget extends StatelessWidget {
  const MyAddressesContainerWidget({super.key, required this.address});
  final AddressEntity address;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withAlpha(45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Row(
          children: [
            SvgWidget(
              svg: AppImages.location,
              color: AppColor.primaryColor,
              width: 6.w,
            ),
            SizedBox(width: 1.w),
            Text(
              "${address.streetName} / ${address.addressName}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            RadioWidget(selected: false, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
