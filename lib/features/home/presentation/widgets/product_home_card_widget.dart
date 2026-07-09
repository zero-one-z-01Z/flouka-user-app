import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_images.dart';

class ProductHomeCardWidget extends StatelessWidget {
  const ProductHomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: 100.w,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.productCard),fit: BoxFit.fill)
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
        margin: EdgeInsets.symmetric(horizontal: 2.w,),
        child: Row(
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(LanguageProvider.translate("home", "card_title"),
                style: TextStyleClass.normalStyle(color: Colors.white),),
              Text(LanguageProvider.translate("home", "card_des"),
                style: TextStyleClass.smallStyle(color: Colors.white),),
            ],)),
             SizedBox(width: 1.w,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white,width: 2),
              ),
              child: Text(LanguageProvider.translate("home", "card_button"),
                style: TextStyleClass.smallStyle(color: Colors.white),),
            ),
            SizedBox(width: 4.w,),

          ],
        ),
      ),
    );
  }
}
