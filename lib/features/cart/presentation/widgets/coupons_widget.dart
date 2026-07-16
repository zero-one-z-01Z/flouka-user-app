import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/coupon_provider.dart';

class CouponsWidget extends StatelessWidget {
  const CouponsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate("global", "coupon_code"),
          style: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 1.3.h),
        Consumer<CouponProvider>(
          builder: (context, value, child) => Column(
            spacing: 0.h,
            children: List.generate(value.couponsFields.length, (index) {
              return Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: TextFieldWidget(controller: value.couponsFields[index].controller,
                      borderRadius: 16,
                      suffix: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: ButtonWidget(height: 5.h,
                          onTap: () {
                            value.handleTap(coupon: value.couponsFields[index]);
                          },
                          text: !value.couponsFields[index].isApplied ? "activate" : "cancel",
                          width: 20.w,
                          color: !value.couponsFields[index].isApplied ? AppColor.primaryColor : Colors.redAccent,
                        ),
                      ),
                      hintText:  "    X X X X X X X X X X   ",),
                  )

                ],
              );
            },),
          ),
        ),
      ],
    );
  }
}
