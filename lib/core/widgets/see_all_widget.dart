import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_styles.dart';
import '../../features/language/presentation/provider/language_provider.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.style16Normal.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            LanguageProvider.translate("global", "more"),
            style: AppStyles.style16Normal.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
