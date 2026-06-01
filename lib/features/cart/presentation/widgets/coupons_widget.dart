import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/button_widget.dart';
import '../providers/coupon_provider.dart';

class CouponsWidget extends StatelessWidget {
  const CouponsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<CouponProvider>(
      builder: (context, value, child) => Column(
        spacing: 2.h,
        children: List.generate(value.couponsFields.length, (index) {
          return Row(
            spacing: 8,
            children: [
              Expanded(
                child: DottedBorder(
                  options: const RoundedRectDottedBorderOptions(
                    color: Colors.black,
                    strokeWidth: 1,
                    dashPattern: [4, 3],
                    radius: Radius.circular(10),
                  ),
                  child: TextFormField(
                    controller: value.couponsFields[index].controller,
                    decoration:const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   X X X X X X X X X",
                    ),
                  ),
                ),
              ),
              ButtonWidget(
                onTap: () {
                  value.handleTap(coupon: value.couponsFields[index]);
                },
                text: !value.couponsFields[index].isApplied ? "activate" : "cancel",
                width: 25.w,
                color: !value.couponsFields[index].isApplied ? Colors.green : Colors.redAccent,
              ),
            ],
          );
        },),
      ),
    );
  }
}
