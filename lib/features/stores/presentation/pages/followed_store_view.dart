import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../providers/followed_stores_provider.dart';
import '../widgets/stores_container_home_widget.dart';

class FollowedStoreView extends StatelessWidget {
  const FollowedStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final followedStoresProvider = Provider.of<FollowedStoresProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          if (followedStoresProvider.stores == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          if (followedStoresProvider.stores!.isEmpty) {
            return const Center(
              child: EmptyAnimation(
                title: "no_stores_followed_yet",
                gif: Lotties.noSearch,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              followedStoresProvider.refresh();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                children: List.generate(
                  followedStoresProvider.stores!.length,
                  (index) => StoresContainerHomeWidget(
                    store: followedStoresProvider.stores![index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
