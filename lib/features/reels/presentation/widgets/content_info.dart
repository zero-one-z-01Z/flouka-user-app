// import 'package:flutter/material.dart';
// import 'package:kamseen/core/dialog/dialog_maps.dart';
// import 'package:kamseen/core/dialog/guest_dialog.dart';
// import 'package:kamseen/features/auth/presentation/provider/auth_provider.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../../../config/text_style.dart';
// import '../../../../../core/constants/images.dart';
//
// class ContentInfo extends StatelessWidget {
//   // final BranchEntity branchEntity;
//   const ContentInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: 100.w,
//       alignment: Alignment.bottomCenter,
//       // margin: EdgeInsets.only(
//       //   top: topMargin,
//       // ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(3.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text("اسم ال",
//                         style:
//                             TextStyleClass.semiBoldStyle(color: Colors.white),
//                         overflow: TextOverflow.ellipsis),
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Text(branchEntity.address,
//                         style:
//                             TextStyleClass.normalStyle(color: Colors.white))
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (AuthProvider.isLogin()) {
//                     openDialogMapsSheet(branchEntity.lat, branchEntity.lng);
//                   } else {
//                     showGuestDialog();
//                   }
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.all(3.w),
//                   child: Container(
//                     width: 10.w,
//                     height: 10.w,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(Images.audioTrack),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
