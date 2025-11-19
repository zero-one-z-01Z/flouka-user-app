// import 'package:flutter/material.dart';
// import 'package:gifts/core/config/app_color.dart';
// import 'package:gifts/core/config/app_styles.dart';
// import 'package:gifts/core/widgets/button_widget.dart';
// import 'package:gifts/core/widgets/list_text_field_widget.dart';
// import 'package:gifts/core/widgets/upload_multi_image_widget.dart';
// import 'package:gifts/core/widgets/validation_widget.dart';
// import 'package:gifts/features/language/presentation/provider/language_provider.dart';
// import 'package:gifts/features/products/presentation/providers/add_product_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class AddProductPage extends StatelessWidget {
//   const AddProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<AddProductProvider>();
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           LanguageProvider.translate('global', 'add_product'),
//           style: AppStyles.style17Normal.copyWith(
//             color: Colors.black,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: const Icon(Icons.arrow_back_ios, color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 4.w),
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // ✅ Validate images
//                 ValidationWidget(
//                   conditions: [
//                     {
//                       'value': provider.images.isEmpty,
//                       'text': 'Please upload at least one image',
//                     },
//                   ],
//                   child: UploadMultiImageWidget(
//                     images: provider.images,
//                     count: 5,
//                     deleteImage: provider.deleteImage,
//                     imagesList: provider.setImages,
//                   ),
//                 ),

//                 SizedBox(height: 2.h),

//                 // ✅ Validate text fields
//                 ValidationWidget(
//                   conditions: [
//                     {
//                       'value': provider.inputs.any(
//                         (input) => input.controller.text.trim().isEmpty,
//                       ),
//                       'text': 'All fields are required',
//                     },
//                   ],
//                   child: ListTextFieldWidget(
//                     inputs: provider.inputs,
//                     color: AppColor.secondaryColor,
//                     style: AppStyles.style16Normal,
//                     borderColor: AppColor.primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
//         child: ButtonWidget(
//           color: AppColor.primaryColor,
//           onTap: () async {
//             if (!formKey.currentState!.validate()) return;
//             await provider.createProduct();
//           },
//           text: LanguageProvider.translate('global', 'add_product'),
//         ),
//       ),
//     );
//   }
// }
