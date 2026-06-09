import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/list_text_field_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/upload_multi_image_widget.dart';
import '../providres/create_rate_provider.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({super.key, required this.itemId, required this.orderId, required this.product});
  final int itemId;
  final bool product;
  final int orderId;
  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<CreateRateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate("orders",product ? "rate_product_title": "rate_store_title")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
        height: 100.h,
        width: 100.w,
        child:SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LanguageProvider.translate("orders", product ? "rate_product" : "rate_store"),
                        style: TextStyleClass.normalStyle(),),
                      CustomStarRatingWidget(rating: reviewProvider.rate,onRatingUpdate:(value) {
                        reviewProvider.setRate(value);
                      },),
                      ListTextFieldWidget(inputs: reviewProvider.rateFields),
                      SizedBox(height: 2.h,),
                      UploadMultiImageWidget(
                        images: reviewProvider.reviewImages,
                        count: 5,
                        deleteImage: (index) {
                          reviewProvider.deleteReviewImage(index);
                        },
                        imagesList: (images) {
                          reviewProvider.addReviewImages(images);
                        },
                        title: 'upload_review_images',
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              ButtonWidget(onTap: (){
                reviewProvider.createReview(id:itemId ,orderId: orderId,type:product?"product":"store" ,);
              }, text: "create_review"),
              SizedBox(height: 2.h,),
          
            ],
          ),
        ),
      ),
    );
  }
}
