import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/svg_widget.dart';
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
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgWidget(svg: myOperation.transactionIcon(), width: 8.w),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LanguageProvider.translate("wallet_operation", myOperation.operation),
                          style: TextStyleClass.normalStyle(),
                        ),
                        Text(
                          "${myOperation.createdAt} ",
                          style: TextStyleClass.normalStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Text(
                "${myOperation.price} ${LanguageProvider.translate("global", "dinar")}",
                style: TextStyleClass.normalStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
