import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchbarContainer extends StatelessWidget {
  const SearchbarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xff221F1F).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            const SvgWidget(svg: Images.search, color: Color(0xff7A7979)),
            SizedBox(width: 2.w),
            Text(
              LanguageProvider.translate('categories', 'search'),
              style: TextStyleClass.normalStyle(
                color: const Color(0xff7A7979),
              ).copyWith(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
