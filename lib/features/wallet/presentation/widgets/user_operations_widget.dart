import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';

import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/operation_entity.dart';

class OperationWidgets extends StatelessWidget {
  final OperationEntity myOperation;
  const OperationWidgets({super.key, required this.myOperation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LanguageProvider.translate(
                    "global",
                    myOperation.operation,
                  ),
                  style: TextStyleClass.normalStyle().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat(
                    'dd/MM',
                  ).format(DateTime.parse(myOperation.createdAt)),
                  style: TextStyleClass.smallStyle().copyWith(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          Text(
            "${myOperation.price} ${LanguageProvider.translate("global", "currency")}",
            style: TextStyleClass.normalStyle(color: myOperation.isUp?Colors.green:Colors.red),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Image.asset(
              myOperation.transactionIcon(),
              width: 10.w,
              height: 10.w,
            ),
          ),
        ],
      ),
    );
  }
}
