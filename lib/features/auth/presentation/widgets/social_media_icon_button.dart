import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../domain/entities/social_auth_entity.dart';

class SocialMediaIconButton extends StatelessWidget {
  const SocialMediaIconButton({super.key, required this.socialAuthEntity});

  final SocialAuthEntity socialAuthEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(socialAuthEntity.image, width: 4.w),
          Text(
            LanguageProvider.translate("auth", socialAuthEntity.text),
            style: TextStyleClass.normalStyle().copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4.w),
        ],
      ),
    );
  }
}
