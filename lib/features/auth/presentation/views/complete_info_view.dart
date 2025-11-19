import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/list_text_field_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/complete_info_provider.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final completeInfoProvider = Provider.of<CompleteInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate("auth", "Profile"),
          style: TextStyleClass.headStyle().copyWith(fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Stack(
              children: [
                Image.asset(Images.onboardingImage1, width: 20.w),
                Positioned(
                  bottom: 0,
                  left: 2.w,
                  right: 2.w,
                  child: ButtonWidget(
                    color: const Color(0xffdbf6ff),
                    height: 2.h,
                    width: 8.w,
                    onTap: () {},
                    text: "EDIT",
                    textStyle: TextStyleClass.smallStyle().copyWith(
                      fontSize: 12.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            ListTextFieldWidget(
              inputs: completeInfoProvider.completeInfoTextFieldList,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: ButtonWidget(height: 6.h, width: 80.w, onTap: () {}, text: "Sign Up"),
      ),
    );
  }
}
