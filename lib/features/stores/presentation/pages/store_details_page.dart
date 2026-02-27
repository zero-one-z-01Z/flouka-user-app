import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/stores/presentation/providers/store_details_provider.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_tabs_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/searchbar_container.dart';
import '../widgets/store_details_section.dart';

class StoreDetailsPage extends StatelessWidget {
  const StoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreDetailsProvider storeDetailsProvider =
        Provider.of<StoreDetailsProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFFBFF),
      body: Builder(
        builder: (context) {
          if (storeDetailsProvider.storeDetailsEntity == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          return RefreshIndicator(
            onRefresh: () async {
              storeDetailsProvider.refresh(
                storeDetailsProvider.storeDetailsEntity!.id,
              );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          const BackButton(),
                          SizedBox(width: 0.4.w),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ).copyWith(right: 5.w),
                              child: const SearchbarContainer(
                                fillColor: Colors.white,
                                hintText: 'What are you looking for ?',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CachedNetworkImage(
                        imageUrl:
                            storeDetailsProvider.storeDetailsEntity!.cover ?? "",
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        width: double.infinity,
                        height: 12.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8.h),

                      const StoreDetailsSection(),
                      const StoresTabsWidget(),
                    ],
                  ),
                  Positioned(
                    top: 21.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 34,
                                backgroundImage: AssetImage(AppImages.preson),
                              ),
                              SizedBox(width: 2.w),
                              ButtonWidget(
                                onTap: () {
                                  if (storeDetailsProvider
                                      .storeDetailsEntity!
                                      .isFollowed) {
                                    storeDetailsProvider.unFollow(
                                      storeDetailsProvider.storeDetailsEntity!.id,
                                    );
                                  } else {
                                    storeDetailsProvider.follow(
                                      storeDetailsProvider.storeDetailsEntity!.id,
                                    );
                                  }
                                },
                                text:
                                    storeDetailsProvider
                                        .storeDetailsEntity!
                                        .isFollowed
                                    ? 'unfollow'
                                    : 'follow',
                                width: 16.w,
                                height: 3.h,
                                borderRadius: 4,
                                textStyle: TextStyleClass.normalStyle(
                                  color: Colors.white,
                                ).copyWith(fontSize: 14.sp),
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 168, 168, 168),
                                      blurRadius: 2,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const SvgWidget(
                                  svg: AppImages.share,
                                  color: Color(0xff00A8E1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'This store has been open since ',
                                ),
                                TextSpan(
                                  text: 'April 2020',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
