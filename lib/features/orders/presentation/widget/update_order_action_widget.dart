import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../provider/get_edit_order_provider.dart';

class UpdateOrderActionWidget extends StatelessWidget {
  const UpdateOrderActionWidget({super.key, required this.total});
  final num total;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetEditOrderProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        spacing: 2.h,
        children: [
          ButtonWidget(
            color: const Color(0xffDF0033),
            onTap: () {
              provider.cancelOrder(id: provider.id!);
            },
            text: LanguageProvider.translate("orders", "cancel_entire_order"),
            textStyle: TextStyleClass.normalStyle().copyWith(color: Colors.white),
          ),
          ButtonWidget(
            color: const Color(0xff00A8E1),
            onTap: () {
              provider.acceptOrderRules(id: provider.id!);
            },
            text: LanguageProvider.translate("orders", "continue_available"),
            textStyle: TextStyleClass.normalStyle().copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageProvider.translate("orders", "total_price_updated"),
                style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
              ),
              PriceWidget(price: total),
            ],
          ),
        ],
      ),
    );
  }
}
