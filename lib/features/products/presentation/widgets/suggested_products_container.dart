import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/widgets/suggested_product_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SuggestedProductsSection extends StatelessWidget {
  const SuggestedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      height: 35.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEFFBFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LanguageProvider.translate('global', 'suggested_products'),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                LanguageProvider.translate('global', 'see_all'),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const SuggestedProductContainer(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
