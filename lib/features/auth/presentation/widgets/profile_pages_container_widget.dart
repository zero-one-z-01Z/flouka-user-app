import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';

class ProfilePagesContainerWidget extends StatelessWidget {
  const ProfilePagesContainerWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.svg,
  });

  final String title;
  final String subTitle;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgWidget(svg: svg),
          SizedBox(width: 2.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate('global', title),
                style: TextStyleClass.headStyle().copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                LanguageProvider.translate('global', subTitle),
                style: TextStyleClass.headStyle().copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
