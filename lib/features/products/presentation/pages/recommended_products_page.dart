import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/recommend_products_provider.dart';
import '../widgets/hot_deals_home_container_widget.dart';

class RecommendedProductsPage extends StatelessWidget {
  const RecommendedProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendProductsProvider = Provider.of<RecommendProductsProvider>(context);
    recommendProductsProvider.pagination();
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageProvider.translate('home', 'recommended')),
      ),
      body: SizedBox(
        height: 100.h,width: 100.w,
        child: RefreshIndicator(
          onRefresh: () async {
            recommendProductsProvider.refresh();
          },

          child: SingleChildScrollView(
            controller: recommendProductsProvider.controller,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h).copyWith(top: 2.h,),
              child: Builder(
                builder: (context) {
                if(recommendProductsProvider.data == null){
                  return const Center(child: LoadingAnimationWidget(gif: Lotties.loading,));
                  }else if(recommendProductsProvider.data!.isEmpty){
                  return const Center(child: EmptyAnimation(gif: Lotties.noSearch,title: "",));
                  }
                  return Wrap(
                    children: List.generate(recommendProductsProvider.data!.length, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        child: HotDealsHomeContainerWidget(
                          product: recommendProductsProvider.data![index],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
