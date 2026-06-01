import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../products/presentation/widgets/hot_deals_home_container_widget.dart';
import '../providers/favorite_provider.dart';
import '../widgets/favorite_item_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LanguageProvider.translate("settings", "favourite"),),
        centerTitle: true,
      ),

      body: Consumer<FavoriteProvider>(
        builder: (context, provider, child) {

          return RefreshIndicator(
            onRefresh: ()async{
              provider.refresh();
            },
            child: SingleChildScrollView(
              controller: provider.controller,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Builder(
                builder: (context) {
                  if (provider.data == null) {
                    return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
                  }
                  if (provider.data!.isEmpty) {
                    return const Center(
                      child: EmptyAnimation(gif: Lotties.noSearch, title: "no_favorite"),
                    );
                  }

                  return Column(
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.h,
                        crossAxisSpacing: 0.w,
                        children: [
                          for (int i = 0; i < provider.data!.length; i++) ...[
                            StaggeredGridTile.fit(
                              crossAxisCellCount: 1,
                              child: Builder(
                                builder: (context) {
                                  // Fixed image height
                                  final imageHeight = 12.h;

                                  // Apply top padding to every right item (odd index)
                                  double topPadding = (i % 2 == 1) ? 2.h : 0;

                                  return Padding(
                                    padding: EdgeInsets.only(top: topPadding),
                                    child: HotDealsHomeContainerWidget(
                                      product: provider.data![i],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (provider.paginationStarted)
                        const Center(child: LoadingWidget()),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
