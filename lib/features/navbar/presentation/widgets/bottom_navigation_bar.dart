// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../core/config/app_color.dart';
// import '../../../../core/config/app_styles.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../../core/widgets/svg_widget.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../provider/nav_provider.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     NavBarProvider main = Provider.of(context, listen: true);

//     return Stack(
//       children: [
//         Container(
//           color: Colors.transparent,
//           padding: EdgeInsets.only(top: 7.w),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(4.w),
//             ),
//             padding: EdgeInsets.only(bottom: 3.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(main.items.length, (index) {
//                 return InkWell(
//                   onTap: () {
//                     main.setIndex(index);
//                   },
//                   child: SizedBox(
//                     width: index == main.index ? 18.w : 19.w,
//                     child: index == main.index
//                         ? const SizedBox()
//                         : Column(
//                             key: ValueKey<int>(index),
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SizedBox(
//                                 height: 12.w,
//                                 width: 12.w,
//                                 child: SvgWidget(
//                                   svg: main.items[index]['image'],
//                                   height: 6.w,
//                                   width: 6.w,
//                                   color: AppColor.primaryColor,
//                                 ),
//                               ),
//                               Text(
//                                 LanguageProvider.translate(
//                                   "home",
//                                   main.items[index]['title'],
//                                 ),
//                                 style: TextStyleClass.captionStyle(
//                                   color: AppColor.primaryColor,
//                                 ),
//                               ),
//                               SizedBox(height: 0.5.h),
//                             ],
//                           ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//         AnimatedPositionedDirectional(
//           curve: Curves.easeIn,
//           duration: Duration(
//             milliseconds: main.getDifferentIndex > 1
//                 ? 150 * main.getDifferentIndex
//                 : 300,
//           ),
//           start: main.index == 0
//               ? 2.w
//               : ((main.index * (2.w * 10) - (0.5.w * main.index))),
//           child: AnimatedSwitcher(
//             // switchInCurve: Curves.easeIn,
//             // switchOutCurve: Curves.easeIn,
//             transitionBuilder: (child, animation) {
//               final tween = Tween(begin: 0.6, end: 1.0);
//               final fadeAnimation = animation.drive(tween);

//               return ScaleTransition(
//                 scale: fadeAnimation,
//                 // sizeFactor: animation,
//                 // position: Tween<Offset>(begin:Offset(0,-1),end:Offset(0,0)).animate(animation),
//                 child: child,
//               );
//             },
//             // layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
//             //   return Stack(
//             //     alignment: Alignment.topCenter,
//             //     children: <Widget>[
//             //       ...previousChildren,
//             //       if (currentChild != null) currentChild,
//             //     ],
//             //   );
//             // },
//             duration: Duration(
//               milliseconds: main.getDifferentIndex > 1
//                   ? 150 * main.getDifferentIndex
//                   : 300,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   key: ValueKey<int>(main.index),
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           bottom: Constants.isTablet ? 0.8.h : 0.5.h,
//                         ),
//                         height: 18.w,
//                         width: 18.w,
//                         decoration: const BoxDecoration(shape: BoxShape.circle),
//                         child: AnimatedSwitcher(
//                           duration: const Duration(milliseconds: 300),
//                           transitionBuilder:
//                               (Widget child, Animation<double> animation) {
//                                 return FadeTransition(
//                                   opacity: animation,
//                                   child: child,
//                                 );
//                               },
//                           child: main.index == main.previousIndex
//                               ? SvgWidget(
//                                   svg: main.items[main.index]['image'],
//                                   height: 6.w,
//                                   width: 6.w,
//                                   color: Colors.white,
//                                 )
//                               : const SizedBox(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   LanguageProvider.translate(
//                     "home",
//                     main.items[main.index]['title'],
//                   ),
//                   style: TextStyleClass.captionStyle(color: AppColor.primaryColor),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
