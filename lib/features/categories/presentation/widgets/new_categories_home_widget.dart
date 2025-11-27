import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewCategoriesHomeWidget extends StatelessWidget {
  const NewCategoriesHomeWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 16.h,
          width: 30.w,
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.2.h),
          padding: EdgeInsets.symmetric(vertical: 0.2.h),
          decoration: BoxDecoration(
            color: const Color(0xffE1F7FE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.2.h,
            ).copyWith(bottom: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                  child: Text(
                    LanguageProvider.translate('global', title),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          left: 0,
          child: SvgWidget(
            svg: 'assets/images/categories/background.svg',
            width: 10.w,
            height: 10.h,
          ),
        ),
        Positioned(
          bottom: 0.2.h,
          left: 5.w,
          child: Image.asset(
            image,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
