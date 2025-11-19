// import 'package:flutter/material.dart';
// import 'package:gifts/core/config/app_styles.dart';
// import 'package:gifts/core/constants/app_images.dart';
// import 'package:gifts/features/language/presentation/provider/language_provider.dart';
// import 'package:sizer/sizer.dart';

// class MarketHomeCategoriesRowWidget extends StatelessWidget {
//   const MarketHomeCategoriesRowWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 16.h,
//             decoration: BoxDecoration(
//               color: const Color(0xffEBB004),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(child: Image.asset(AppImages.ordersIcon)),
//                 Text(
//                   LanguageProvider.translate('categories', 'orders'),
//                   style: AppStyles.style18Normal.copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(width: 2.w),
//         Expanded(
//           child: Container(
//             height: 16.h,
//             decoration: BoxDecoration(
//               color: const Color(0xffD38F76),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(AppImages.helpIcon, width: 20.w),
//                 Text(
//                   LanguageProvider.translate('categories', 'market'),
//                   style: AppStyles.style18Normal.copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(width: 2.w),
//         Expanded(
//           child: Container(
//             height: 16.h,
//             decoration: BoxDecoration(
//               color: const Color(0xffA93829),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(AppImages.helpIcon, width: 20.w),
//                 Text(
//                   LanguageProvider.translate('categories', 'help'),
//                   style: AppStyles.style18Normal.copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
