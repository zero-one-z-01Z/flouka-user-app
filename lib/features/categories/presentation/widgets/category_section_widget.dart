// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:gifts/core/config/app_color.dart';
// import 'package:gifts/core/config/app_styles.dart';
// import 'package:gifts/features/categories/presentation/providers/categories_provider.dart';
// import 'package:gifts/features/nav_bar/presentation/providers/user_nav_provider.dart';
// import 'package:gifts/features/products/presentation/providers/products_provider.dart';
// import 'package:gifts/features/language/presentation/provider/language_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class CategorySectionWidget extends StatelessWidget {
//   const CategorySectionWidget({super.key, this.isHome = false});

//   final bool isHome;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CategoryProvider>(
//       builder: (context, provider, child) {
//         if (provider.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (provider.categories.isEmpty) {
//           return const Center(child: Text("No categories found"));
//         }

//         final categories = provider.categories;
//         final isSingle = categories.length == 1;

//         return Wrap(
//           spacing: 2.w,
//           runSpacing: 2.h,
//           alignment: WrapAlignment.center,
//           children: List.generate(categories.length, (index) {
//             final category = categories[index];
//             final isSelected = provider.selectedCategory?.id == category.id;

//             BorderRadius borderRadius;
//             if (isSingle) {
//               borderRadius = BorderRadius.circular(12);
//             } else {
//               final positionInRow = index % 3;
//               if (positionInRow == 0) {
//                 borderRadius = const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                   topRight: Radius.circular(50),
//                 );
//               } else if (positionInRow == 2) {
//                 borderRadius = const BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 );
//               } else {
//                 borderRadius = const BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                   topRight: Radius.circular(50),
//                 );
//               }
//             }

//             return GestureDetector(
//               onTap: () {
//                 if (isHome) {
//                   Provider.of<UserNavProvider>(
//                     context,
//                     listen: false,
//                   ).changeIndex(3);
//                 }
//                 ;

//                 provider.selectCategory(category);
//                 context.read<ProductsProvider>().setCategory(category.id);
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 width: 28.w,
//                 height: 13.h,
//                 decoration: BoxDecoration(
//                   color: AppColor.secondaryColor,
//                   borderRadius: borderRadius,
//                   border: Border.all(
//                     color: isSelected
//                         ? AppColor.primaryColor
//                         : Colors.transparent,
//                     width: 2,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: category.image,
//                       width: 15.w,
//                       height: 6.h,
//                       fit: BoxFit.contain,
//                       placeholder: (_, __) => const Center(
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                       errorWidget: (_, __, ___) =>
//                           const Icon(Icons.error_outline),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       LanguageProvider.translate('categories', category.name),
//                       style: AppStyles.style16Normal.copyWith(
//                         fontWeight: isSelected
//                             ? FontWeight.bold
//                             : FontWeight.w500,
//                         color: isSelected
//                             ? AppColor.primaryColor
//                             : Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }
