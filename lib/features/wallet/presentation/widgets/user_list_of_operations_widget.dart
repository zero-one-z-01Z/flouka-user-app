import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/animation/fade_transition_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/wallet_provider.dart';
import 'user_operations_widget.dart';

class ListOfTransactionWidgets extends StatelessWidget {
  const ListOfTransactionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var walletProvider = Provider.of<WalletProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      width: 100.w,
      child: FadeTransitionWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: ValueKey(walletProvider.myOperations),
          children: [
            if (walletProvider.myOperations != null &&
                walletProvider.myOperations!.isNotEmpty)
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  LanguageProvider.translate("global", "operations"),
                  style: TextStyleClass.normalStyle().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ...List.generate((walletProvider.myOperations?.length ?? 6), (
              index,
            ) {
              if (walletProvider.myOperations == null) {
                // return ShimmerWidget(height: 7.h, width: 100.w);
              } else {
                return OperationWidgets(
                  myOperation: walletProvider.myOperations![index],
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
