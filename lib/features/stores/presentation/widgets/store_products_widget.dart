import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/empty_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../../core/widgets/searchbar_container.dart';
import '../../../products/presentation/widgets/hot_deals_home_container_widget.dart';
import '../providers/stores_product_provider.dart';

class StoreProductsWidget extends StatelessWidget {
  const StoreProductsWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoresProductProvider>(context);
    final hotDeals = provider.data;
    provider.pagination();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 2.h),
      child: Column(
        children: [
          SearchbarContainer(
            controller: provider.searchController,
            hintText: "",
            onChanged: (){
              provider.onTextChanged();
            },
            readOnly: false,
          ),
          SizedBox(height: 2.h),
          Builder(
              builder: (context) {
                if(hotDeals==null){
                  return const LoadingAnimationWidget(gif: Lotties.loading,);
                }else if(hotDeals.isEmpty){
                  return const EmptyAnimation(gif: Lotties.noSearch,title: "",);
                }
                return SizedBox(width: 100.w,
                  child: Wrap(
                    runSpacing: 1.h,
                    children: List.generate(hotDeals.length, (index){
                      return HotDealsHomeContainerWidget(
                        product: hotDeals[index],
                      );
                    }),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
