
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../providers/complete_info_provider.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final completeDataProvider = Provider.of<CompleteInfoProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryColor, width: 2),
              image: DecorationImage(
                image: completeDataProvider.showUserImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
