import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/custom_star_rating_widget.dart';
import 'package:flouka/features/stores/domain/entity/store_entity.dart';
import 'package:flouka/features/stores/presentation/providers/store_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class StoresContainerHomeWidget extends StatelessWidget {
  const StoresContainerHomeWidget({super.key, required this.store});

  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    final StoreDetailsProvider storeDetailsProvider =
        Provider.of<StoreDetailsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        storeDetailsProvider.goToStoreDetailsPage(store.id);
      },
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.primaryColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.secondaryColor, width: 0.2.w),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(store.vendor.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      store.name,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      store.vendor.bio,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleClass.smallStyle(),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomStarRatingWidget(
                          rating: store.rate,readOnly: true,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          store.rate.toString(),
                          style: TextStyleClass.smallStyle(color: Colors.amber),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
