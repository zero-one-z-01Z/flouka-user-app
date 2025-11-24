import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/navigation.dart';
import '../provider/ticket_message_provider.dart';

class TicketMessageTitleWidget extends StatelessWidget {
  const TicketMessageTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TicketMessageProvider ticketMessageProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        // border: Border.symmetric(horizontal:BorderSide(color: AppColor.defaultColor.withAlpha((0.5*255).round()))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              navPop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Icon(Icons.arrow_back_ios, size: 5.w, color: Colors.black),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                (ticketMessageProvider.ticketEntity?.title) ?? "",
                maxLines: 1,
                style: TextStyleClass.normalStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
