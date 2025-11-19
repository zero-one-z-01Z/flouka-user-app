import 'package:flouka/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.onBoardingEntity,
    required this.isBackGroundImageLeft,
  });
  final OnBoardingEntity onBoardingEntity;
  final bool isBackGroundImageLeft;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.h,
          width: 100.w,
          child: Stack(
            children: [
              Align(
                alignment: isBackGroundImageLeft
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Image.asset(
                  onBoardingEntity.backGroundImage,
                  height: 45.h,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Transform.scale(
                  scale: 1.2,
                  child: Image.asset(onBoardingEntity.image),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            textAlign: TextAlign.center,
            LanguageProvider.translate("on_boarding", onBoardingEntity.title),
            style: TextStyleClass.headStyle().copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 4.w),
          child: Text(
            LanguageProvider.translate("on_boarding", onBoardingEntity.description),
            textAlign: TextAlign.center,
            style: TextStyleClass.normalStyle().copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
