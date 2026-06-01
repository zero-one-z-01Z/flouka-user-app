import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/order_details_entity.dart';
import '../provider/get_edit_order_provider.dart';
import '../widget/update_order_action_widget.dart';
import '../widget/update_order_item_widget.dart';

class UpdateOrderView extends StatelessWidget {
  const UpdateOrderView({super.key, });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetEditOrderProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFFBFF),
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "Update on Your Order")),
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child:provider.data !=null ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 8,
                    children: [
                      SizedBox(height: 1.h),
                      if(provider.data?['order_items'].isNotEmpty??false)
                      ...List.generate(
                        provider.data?['order_items']?.length??0,
                        (index) => UpdateOrderItemWidget(
                          orderItem: provider.data!['order_items']![index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UpdateOrderActionWidget(total: provider.data?['total']??0,),
              SizedBox(height: 3.h),
            ],
          ),
        ) : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
