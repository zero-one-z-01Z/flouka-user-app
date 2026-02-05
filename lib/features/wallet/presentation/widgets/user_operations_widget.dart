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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 2.h,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        myOperation.operation == "deducted"
                            ? AppImages.arrowDown
                            : AppImages.arrowUp,
                        width: 15.w,
                        height: 15.w,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Column(
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
                        SizedBox(height: 0.5.h),
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
                  ],
                ),
              ),
              // Spacer(),
              Text(
                "${myOperation.price} ${LanguageProvider.translate("global", "US")}",
                style: TextStyleClass.normalStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
