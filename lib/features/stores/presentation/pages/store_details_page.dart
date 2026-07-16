import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flouka/features/reviews/presentation/providres/create_rate_provider.dart';
import 'package:flouka/features/reviews/presentation/views/create_review_page.dart';
import 'package:flouka/features/stores/presentation/providers/store_details_provider.dart';
import 'package:flouka/features/stores/presentation/providers/store_reviews_provider.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_tabs_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/store_details_entity.dart';
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
    StoreDetailsEntity? storeDetailsEntity = storeDetailsProvider.storeDetailsEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('home','store_details')),
      ),
      body: Builder(
        builder: (context) {
          if (storeDetailsEntity == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          return RefreshIndicator(
            onRefresh: () async {
              storeDetailsProvider.refresh(storeDetailsEntity.id,);
              if(storesProvider.current==0){
                storesProductProvider.refresh();
              } else if(storesProvider.current==1){
                storeReviewsProvider.refresh();
              }
            },
            child: Stack(alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(top: 2.h,
                  left: 1.w,right: 1.w,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: CachedNetworkImage( imageUrl: storeDetailsEntity.vendor?.cover ?? "",
                      errorWidget: (context, url, error) { return const Icon(Icons.error); },
                      width: 100.w, height: 20.h, fit: BoxFit.cover, ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller:storesProvider.current==0 ? storesProductProvider.controller :storeReviewsProvider.controller,
                  child: Container(width: 100.w, padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                    margin: EdgeInsets.symmetric(horizontal: 4.w).copyWith(top: 15.h),
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 1.h),
                        Row(children: [
                          CircleAvatar( radius: 34,backgroundColor: Colors.grey.shade300,
                            backgroundImage: CachedNetworkImageProvider(storeDetailsEntity.vendor!.logo), ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${storeDetailsEntity.name}',style:TextStyleClass.normalStyle(),maxLines: 2,
                                  ),
                                  Row(
                                    children: [
                                      SvgWidget(svg: AppImages.star, color: Colors.amber, width: 5.w),
                                      SizedBox(width: 1.w),
                                      Text(storeDetailsEntity.avgRating.toString(),
                                        style: TextStyleClass.smallStyle().copyWith(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 1.w),
                                      Text("(${storeDetailsEntity.productsCount}) ${LanguageProvider.translate("global", "product")}",
                                        style: TextStyleClass.smallStyle(color: Colors.grey.shade700),),
                                    ],
                                  ),
                                  // Text(storeDetailsEntity.bio,),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()async{
                              String url = '${Constants.baseUri}store?id=${storeDetailsEntity.id}';
                              final box = context.findRenderObject() as RenderBox?;
                              await Share.share("${LanguageProvider.translate('settings', 'share_store_description')
                                  .replaceFirst("*name*", "${storeDetailsEntity.vendor!.name}")}\n$url",
                                sharePositionOrigin: Constants.isTablet?
                                (box!.localToGlobal(Offset.zero) & box.size):null,);
                            },
                            child: Container( padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                              decoration: BoxDecoration( color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(10),),
                              child: Row(
                                children: [
                                  const SvgWidget( svg: AppImages.share,),
                                  SizedBox(width: 1.w),
                                  Text(LanguageProvider.translate('settings', 'share'),
                                    style: TextStyleClass.smallStyle(color: Colors.white).copyWith(fontWeight: FontWeight.bold),),
                                ],
                              ), ),
                          ),
                          // ButtonWidget( onTap: () {
                          //   storeDetailsProvider.updateFollow( storeDetailsEntity!.id, );
                          //
                          // }, text: storeDetailsProvider .storeDetailsEntity! .isFollowed ? 'unfollow' : 'follow',
                          //   width: 20.w, height: 3.5.h, borderRadius: 4,
                          //   textStyle: TextStyleClass.normalStyle( color: Colors.white, ).copyWith(fontSize: 14.sp),
                          // ),
                        ],),
                        SizedBox(height: 1.h),
                        const StoreDetailsSection(),
                        SizedBox(height: 2.h),
                        const StoresTabsWidget(),
                        SizedBox(height: 2.h),
                      ],
                    ), ),
                ), ],
            ),
          );
        },
      ),
    );
  }
}
