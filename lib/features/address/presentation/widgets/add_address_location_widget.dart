import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';

class AddAddressLocationWidget extends StatelessWidget {
  const AddAddressLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "26 amna hafiz /street 23/door 24 alexandria sidegaber el mosher tantaimow",
                style: TextStyleClass.smallStyle().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Alexandria",
                style: TextStyleClass.smallStyle(
                  color: Colors.grey,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Stack(
          children: [
            Image.asset(
              Images.locationMap,
              width: 17.w,
              height: 17.w,
              fit: BoxFit.cover,
            ),
            Positioned(
              width: 17.w,
              height: 2.h,
              bottom: 1.h,

              child: ButtonWidget(
                color: Colors.white,
                borderRadius: 12,
                textStyle: TextStyleClass.smallStyle().copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {},
                text: "Edit",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
