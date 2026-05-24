import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../domain/entity/product_entity.dart';
import '../providers/products_details_provider.dart';

class CustomProductDetailsDotsIndicators extends StatelessWidget {
  const CustomProductDetailsDotsIndicators({super.key, required this.imagesList});
  final List<ProductImage> imagesList;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return Consumer<ProductDetailsProvider>(
        builder: (context, productImagesProvider, child) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imagesList.length,(index) => Container(
              key: Key('dots'+index.toString()),
              width:2.w,height: 2.w,margin: EdgeInsets.symmetric(horizontal: 1.w),
              decoration: BoxDecoration(color: productImagesProvider.imageIndex ==index ?AppColor.primaryColor:Colors.grey.shade300,
                  shape: BoxShape.circle),
            ),),
          );
        }
    );
  }
}
