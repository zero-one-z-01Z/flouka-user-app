// import 'package:flutter/material.dart';
// import 'package:gifts/core/constants/app_images.dart';
// import 'package:gifts/core/constants/app_lotties.dart';
// import 'package:gifts/core/widgets/loading_animation_widget.dart';
// import 'package:gifts/core/widgets/svg_widget.dart';
// import 'package:gifts/features/banners/presentation/widgets/product_banner_widget.dart';
// import 'package:gifts/features/cart/presentation/providers/add_to_cart_provider.dart';
// import 'package:gifts/features/cart/presentation/providers/cart_provider.dart';
// import 'package:gifts/features/language/presentation/provider/language_provider.dart';
// import 'package:gifts/features/market/presentation/provider/market_details_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../core/config/app_color.dart';
// import '../../../../core/config/app_styles.dart';
// import '../../../../core/widgets/button_widget.dart';
// import '../providers/product_details_provider.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final productDetailsProvider = Provider.of<ProductDetailsProvider>(context);
//     final CartProvider cartProvider = Provider.of<CartProvider>(context);
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(LanguageProvider.translate('global', 'product')),
//           leading: IconButton(
//             onPressed: () {
//               productDetailsProvider.goToPrevious();
//             },
//             icon: const Icon(Icons.arrow_back),
//           ),
//         ),
//         body: Builder(
//           builder: (context) {
//             if (productDetailsProvider.data == null) {
//               return const Center(
//                 child: LoadingAnimationWidget(gif: AppLotties.loading),
//               );
//             }

//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 7.w),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ProductBannerWidget(
//                       productEntity: productDetailsProvider.data!,
//                     ),
//                     Text(
//                       '${productDetailsProvider.data?.price ?? "no price"} د.ك',
//                       style: AppStyles.style18Normal.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.teritaryColor,
//                       ),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       productDetailsProvider.data?.name ?? "no name yet",
//                       style: AppStyles.style17Normal.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       productDetailsProvider.data?.description ??
//                           "no description yet",
//                       style: AppStyles.style15Normal,
//                     ),
//                     SizedBox(height: 2.h),
//                     Text(
//                       LanguageProvider.translate(
//                         'categories',
//                         'seller_details',
//                       ),
//                       style: AppStyles.style16Normal.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 2.h),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 4.5.w,
//                           backgroundColor: AppColor.primaryColor,
//                           backgroundImage:
//                               productDetailsProvider.data!.market!.image !=
//                                       null &&
//                                   productDetailsProvider
//                                       .data!
//                                       .market!
//                                       .image!
//                                       .isNotEmpty
//                               ? NetworkImage(
//                                   productDetailsProvider.data!.market!.image!,
//                                 )
//                               : const AssetImage(AppImages.gift)
//                                     as ImageProvider,
//                         ),
//                         SizedBox(width: 2.w),
//                         Text(
//                           productDetailsProvider.data?.market?.name ??
//                               "no name yet",
//                         ),
//                         const Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             Provider.of<MarketDetailsProvider>(
//                               context,
//                               listen: false,
//                             ).goToPage({
//                               'market_id':
//                                   productDetailsProvider.data?.market?.id,
//                             });
//                           },
//                           child: Container(
//                             width: 20.w,
//                             height: 6.5.w,
//                             decoration: BoxDecoration(
//                               color: AppColor.primaryColor,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 LanguageProvider.translate(
//                                   'global',
//                                   'showMarket',
//                                 ),
//                                 style: AppStyles.style15Normal.copyWith(
//                                   color: Colors.white,
//                                   fontSize: 14.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: Padding(
//           padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
//           child: ButtonWidget(
//             onTap: () {
//               cartProvider.addToCart(productDetailsProvider.data!.id!);
//             },
//             text: 'add_to_cart',
//             height: 4.h,
//             textStyle: AppStyles.style16Normal.copyWith(color: Colors.white),
//             widget: Padding(
//               padding: EdgeInsets.only(left: 2.w),
//               child: const SvgWidget(svg: AppImages.cart, color: Colors.white),
//             ),
//             widgetAfterText: false,
//           ),
//         ),
//       ),
//     );
//   }
// }
