import 'package:cached_network_image/cached_network_image.dart';
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
          return Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagesList.length,(index) => Container(
                  key: Key('dots'+index.toString()),
                  width:3.w,height: 3.w,margin: EdgeInsets.symmetric(horizontal: 1.w),
                  decoration: BoxDecoration(color: productImagesProvider.imageIndex ==index ?AppColor.secondaryColor:Colors.grey.shade400,
                      border: Border.all(color: AppColor.secondaryColor,width: 2),
                      shape: BoxShape.circle),
                ),),
              ),
              Container(height: 0.1.h,color: Colors.grey.shade200,width: 100.w,margin: EdgeInsets.symmetric(vertical: 2.h),),
              Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(imagesList.length,(index) => InkWell(
                  onTap: (){
                    productDetailsProvider.animateToImage(index: index);
                  },
                  child: Container(
                    key: Key('image'+index.toString()),
                    width:20.w,height: 20.w,margin: EdgeInsets.symmetric(horizontal: 2.w,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: productImagesProvider.imageIndex ==index ?
                        AppColor.secondaryColor:Colors.transparent,width: 2),
                        image:DecorationImage(image: CachedNetworkImageProvider(imagesList[index].image),fit: BoxFit.cover)
                        ),
                  ),
                ),),
              ),
              Container(height: 0.1.h,color: Colors.grey.shade200,width: 100.w,margin: EdgeInsets.symmetric(vertical: 2.h),),
            ],
          );
        }
    );
  }
}
