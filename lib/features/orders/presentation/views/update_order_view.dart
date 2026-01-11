import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widget/update_order_action_widget.dart';
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
                    spacing: 8,
                    children: [
                      SizedBox(height: 1.h),
                      ...List.generate(
                        3,
                        (index) => UpdateOrderItemWidget(isOutOfStock: index == 2),
                      ),
                    ],
                  ),
                ),
              ),
              const UpdateOrderActionWidget(),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}
