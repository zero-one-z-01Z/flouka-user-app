
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';

class AddAddressLocationWidget extends StatelessWidget {
  const AddAddressLocationWidget({
    super.key,
  });

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
        Image.asset(Images.signup2, width: 15.w, height: 15.w),
      ],
    );
  }
}
