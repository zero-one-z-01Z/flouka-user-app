import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 15.w,
                height: 15.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primaryColor, width: 0.7.w),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(store.image),
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
                    SizedBox(height: 0.5.h),
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
