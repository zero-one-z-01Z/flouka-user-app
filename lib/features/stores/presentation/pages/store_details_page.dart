import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flouka/features/stores/presentation/providers/store_details_provider.dart';
import 'package:flouka/features/stores/presentation/providers/store_reviews_provider.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_tabs_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../providers/stores_product_provider.dart';
import '../providers/stores_provider.dart';
import '../widgets/store_details_section.dart';

class StoreDetailsPage extends StatelessWidget {
  const StoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreDetailsProvider storeDetailsProvider = Provider.of<StoreDetailsProvider>(context);
    final StoresProvider storesProvider = Provider.of<StoresProvider>(context);
    final StoresProductProvider storesProductProvider = Provider.of<StoresProductProvider>(context, listen: false);
    final StoreReviewsProvider storeReviewsProvider = Provider.of<StoreReviewsProvider>(context, listen: false);

    if(storesProvider.current==0){
      storesProductProvider.pagination();
    }else{
      storeReviewsProvider.pagination();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xffEFFBFF),
      extendBodyBehindAppBar: true,
      body: Builder(
        builder: (context) {
          if (storeDetailsProvider.storeDetailsEntity == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          return RefreshIndicator(
            onRefresh: () async {
              storeDetailsProvider.refresh(storeDetailsProvider.storeDetailsEntity!.id,);
              if(storesProvider.current==0){
                storesProductProvider.refresh();
              } else if(storesProvider.current==1){
                storeReviewsProvider.refresh();
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller:storesProvider.current==0 ? storesProductProvider.controller :storeReviewsProvider.controller,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                    CachedNetworkImage( imageUrl: storeDetailsProvider.storeDetailsEntity!.cover ?? "",
                      errorWidget: (context, url, error) { return const Icon(Icons.error); },
                      width: double.infinity, height: 20.h, fit: BoxFit.cover, ),
                    Positioned( bottom: -4.h, child: Container(width: 100.w, padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row( children: [ Row( children: [ CircleAvatar( radius: 34,backgroundColor: Colors.grey.shade300,
                        backgroundImage: CachedNetworkImageProvider(storeDetailsProvider.storeDetailsEntity!.image!), ),
                        SizedBox(width: 2.w), ButtonWidget( onTap: () {
                          if (storeDetailsProvider .storeDetailsEntity! .isFollowed)
                        { storeDetailsProvider.unFollow( storeDetailsProvider.storeDetailsEntity!.id, ); }
                        else { storeDetailsProvider.follow( storeDetailsProvider.storeDetailsEntity!.id, ); }
                        }, text: storeDetailsProvider .storeDetailsEntity! .isFollowed ? 'unfollow' : 'follow',
                          width: 20.w, height: 3.h, borderRadius: 4,
                          textStyle: TextStyleClass.normalStyle( color: Colors.white, ).copyWith(fontSize: 14.sp), ), ], ),
                        SizedBox(width: 2.w),
                        const Spacer(),
                        Container( padding: EdgeInsets.all(3.w),
                          decoration: const BoxDecoration( color: Colors.white, shape: BoxShape.circle,
                            boxShadow: [ BoxShadow( color: Color.fromARGB(255, 168, 168, 168), blurRadius: 2,
                              offset: Offset(0, 4), ), ], ),
                          child: const SvgWidget( svg: AppImages.share, color: Color(0xff00A8E1), ), ), ], ), ), ), ],
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${storeDetailsProvider.storeDetailsEntity!.name}',
                        ),

                        Text(
                          storeDetailsProvider.storeDetailsEntity!.bio,
                        ),
                      ],
                    ),
                  ),
                  const StoreDetailsSection(),
                  SizedBox(height: 2.h),
                  const StoresTabsWidget(),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
