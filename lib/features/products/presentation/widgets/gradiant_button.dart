import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entity/product_entity.dart';

class gradiantButton extends StatelessWidget {
  const gradiantButton({
    super.key,
    required this.onTap,
    required this.gradiantcolors,
    required this.vendor,
  });
  final VoidCallback onTap;
  final StoreEntity vendor;
  final List<Color> gradiantcolors;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(vendor.vendor != null)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:const Color(0xff00A8E1),),
              ),
              child: ClipOval(
                child: Container(width: 10.w,height: 10.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: CachedNetworkImageProvider(vendor.vendor!.logo),fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LanguageProvider.translate("global", "sold_by"), style: TextStyleClass.smallStyle()),
              SizedBox(width: 1.w),
              Text(
                vendor.name,
                style: TextStyleClass.smallStyle(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
