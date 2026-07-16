import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.data, required this.last});
  final Map data;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: data['onTap'],
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: data['image'].endsWith('.svg')
                      ? SvgPicture.asset(
                    data['image'],
                    colorFilter: ColorFilter.mode(
                      AppColor.primaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                      : Image.asset(
                    data['image'],
                    fit: BoxFit.contain,
                    color: AppColor.primaryColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          LanguageProvider.translate("settings", data['title']),
                          style: TextStyleClass.normalStyle().copyWith(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      if (data['trailing'] != null)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text(
                            data['trailing'],
                            style: TextStyleClass.normalStyle().copyWith(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        if (!last)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Divider(
              color: Colors.grey.withOpacity(0.05),
              height: 1,
            ),
          ),
      ],
    );
  }
}
