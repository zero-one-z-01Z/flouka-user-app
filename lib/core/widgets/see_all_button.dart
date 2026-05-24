import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../features/stores/presentation/providers/stores_provider.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();

      },
      child: Text(
        LanguageProvider.translate('home', 'see_all'),
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.tertiaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
