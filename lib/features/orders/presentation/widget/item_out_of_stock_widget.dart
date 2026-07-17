import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/get_edit_order_provider.dart';

class ItemOutOfStockWidget extends StatelessWidget {
  const ItemOutOfStockWidget({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetEditOrderProvider>(context);
    return Material(
      elevation: 5,
      shadowColor: Colors.redAccent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => provider.goToOutOfStockItemsPage(id: id),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
          width: 100.w,
          decoration: BoxDecoration(
            color: const Color(0xff950526),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(LanguageProvider.translate("global", "item_out_of_stock"),
                      style: TextStyleClass.normalStyle(color: Colors.white),),
                    // Text(LanguageProvider.translate("global", "items_description").
                    // replaceFirst("*num*", "${order.vendorOrder?.availableItemsCount}").
                    // replaceFirst("*total*","${order.vendorOrder?.items?.length}"),style: TextStyleClass.normalStyle(color: Colors.white),),
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
