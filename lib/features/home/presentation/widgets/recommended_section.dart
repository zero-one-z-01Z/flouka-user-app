// import 'package:flouka/core/widgets/see_all_button.dart';
// import 'package:flouka/features/language/presentation/provider/language_provider.dart';
// import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class RecommendedSection extends StatelessWidget {
//   const RecommendedSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 1.w,
//         vertical: 0.2.h,
//       ).copyWith(left: 2.5.w, top: 1.h, bottom: 1.h),

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.w),

//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 2.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     LanguageProvider.translate('home', 'recommended'),
//                     style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//                   ),
//                   const SeeAllButton(),
//                 ],
//               ),
//             ),
//           ),
//           const HotDealsHomeSection(),
//         ],
//       ),
//     );
//   }
// }
