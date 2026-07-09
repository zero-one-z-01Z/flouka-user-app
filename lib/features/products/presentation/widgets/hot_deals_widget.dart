// ignore_for_file: unused_import

import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/empty_animation.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flouka/features/products/presentation/providers/products_provider.dart';
import 'package:flouka/features/products/presentation/widgets/suggested_products_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../providers/categories_product_search_provider.dart';
import 'hot_deals_home_container_widget.dart';

class HotDealsWidget extends StatelessWidget {
  const HotDealsWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Builder(
          builder: (context) {
            if(products.isEmpty){
              return const SizedBox();
            }
            return SizedBox(
              width: 100.w,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(LanguageProvider.translate("home", "related_products"),
                        style: TextStyleClass.normalStyle(color:const Color(0xff3A3A3A)).copyWith(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 2.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(products.length, (index) {
                        return HotDealsHomeContainerWidget(
                          product: products[index],
                          isSimilar: true,
                        );
                      },),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
