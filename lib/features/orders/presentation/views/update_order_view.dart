import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widget/update_order_item_widget.dart';

class UpdateOrderView extends StatelessWidget {
  const UpdateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFFBFF),
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "Update on Your Order")),
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(height: 1.h),
                      ...List.generate(
                        5,
                        (index) => UpdateOrderItemWidget(isOutOfStock: index == 4),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  spacing: 2.h,
                  children: [
                    ButtonWidget(
                      color: const Color(0xffDF0033),
                      onTap: () {},
                      text: "Cancel the entire order",
                      textStyle: TextStyleClass.normalStyle().copyWith(
                        color: Colors.white,
                      ),
                    ),
                    ButtonWidget(
                      color: const Color(0xff00A8E1),
                      onTap: () {},
                      text: "Continue with available items ",
                      textStyle: TextStyleClass.normalStyle().copyWith(
                        color: Colors.white,
                      ),
                    ),
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
