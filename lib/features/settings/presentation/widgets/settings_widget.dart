import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/new_settings_entity.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.settingsEntity});
  final NewSettingsEntity settingsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: settingsEntity.onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          margin: EdgeInsets.only(top: 1.h),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(16.sp),
                          ),
                          child: SvgWidget(
                            svg: settingsEntity.svgImage,
                            width: 4.w,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 4.w),
                        Text(
                          LanguageProvider.translate(
                            "settings",
                            settingsEntity.text,
                          ),
                          style: TextStyleClass.normalStyle(),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 4.w,
                      color: const Color(0xffA5A5A5),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(color: const Color(0xffEFEFEF), height: 0.15.h),
            ),
          ],
        ),
      ],
    );
  }
}
