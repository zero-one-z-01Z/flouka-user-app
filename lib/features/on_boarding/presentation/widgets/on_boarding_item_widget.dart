import 'package:flouka/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.onBoardingEntity,
  });
  final OnBoardingEntity onBoardingEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: onBoardingEntity.color,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
