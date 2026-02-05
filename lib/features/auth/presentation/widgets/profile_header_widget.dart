import 'package:flouka/features/auth/presentation/widgets/edit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../providers/complete_info_provider.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          CircleAvatar(child: Image.asset(AppImages.preson)),
          SizedBox(width: 2.w),
          Text(
            "MOAZ MOHAMED",
            style: TextStyleClass.normalStyle().copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          EditButtonWidget(
            width: 10.w,
            onTap: () {
              Provider.of<CompleteInfoProvider>(context, listen: false).isEdit =
                  true;
              Provider.of<CompleteInfoProvider>(
                context,
                listen: false,
              ).goToCompleteInfoView();
            },
          ),
        ],
      ),
    );
  }
}
