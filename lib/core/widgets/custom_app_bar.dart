import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/app_color.dart';
import '../config/app_styles.dart';
import '../constants/assets.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h, left: 4.w, right: 4.w, bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 2.w),
                  Assets.images.home.drawerImage.svg(),
                ],
              ),
              Assets.images.logo.textedLogo.image(),
              Assets.images.home.avatar.image(width: 10.w),
            ],
          ),
          const Divider(color: Color(0xff359dcd)),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 4.w,
                  backgroundColor: const Color(0xff2395c9),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              Text(
                text,
                style: AppStyles.style18Normal.copyWith(color: Colors.white),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ],
      ),
    );
  }
}
