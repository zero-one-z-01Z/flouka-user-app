// import 'package:flutter/material.dart';
// import 'package:gifts/core/config/app_color.dart';
// import 'package:gifts/core/widgets/search_widget.dart';
// import 'package:gifts/features/categories/presentation/widgets/category_section_widget.dart';
// import 'package:gifts/features/products/presentation/widgets/product_list_view_widget.dart';
// import 'package:sizer/sizer.dart';

// class ProductsView extends StatelessWidget {
//   const ProductsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.backgroundColor,
//         body: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🟩 Top Search Bar
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
//                 child: const SearchWidget(editable: true),
//               ),

//               SizedBox(height: 1.h),

//               // 🟦 Categories
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   child: const CategorySectionWidget(),
//                 ),
//               ),

//               SizedBox(height: 2.h),

//               // // 🟧 Section Title
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 5.w),
//               //   child: Text(
//               //     LanguageProvider.translate("global", "all_products"),
//               //     style: AppStyles.style16Normal.copyWith(
//               //       fontWeight: FontWeight.bold,
//               //       color: AppColor.primaryColor,
//               //     ),
//               //   ),
//               // ),
//               SizedBox(height: 1.h),

//               // 🟥 Product List
//               const ProductListViewWidget(),

//               SizedBox(height: 12.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
