import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';

class DeliveryDropdownWidget extends StatelessWidget {
  const DeliveryDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgWidget(svg: Images.location, height: 4.h, width: 4.h),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageProvider.translate("home", "deliver_to"),
              style: TextStyleClass.normalStyle().copyWith(fontSize: 16.sp),
            ),
            Text(
              "..Smouha Alexandria 26",
              style: TextStyleClass.normalStyle().copyWith(fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(width: 2.w),
        Icon(Icons.arrow_drop_down, color: AppColor.primaryColor),
      ],
    );
  }
}
